from sys import stdout
import numpy as np
from time import time
from pyeddl import eddl
from pyeddl import eddlT
from models import VGG16
from pyecvl import ecvl

##########
# CONFIG #
##########
epochs = 50
batch_size = 10
num_classes = 2
shape = (256, 256)
data_yml_path = "../data/padchest.yml"

##################
# MODEL CREATION #
##################
in_ = eddl.Input((1,)+shape)
out = VGG16(in_, num_classes)
net = eddl.Model([in_], [out])

eddl.build(
    net,
    eddl.adam(0.0001),                    # Optimizer
    ["cross_entropy"],                    # Losses
    ["categorical_accuracy"],             # Metrics
    eddl.CS_GPU([1])  # Computing service
)

# Show model architecture
eddl.summary(net)

################
# ECVL DATASET #
################
train_augs = ecvl.SequentialAugmentationContainer([
    ecvl.AugResizeDim(shape, ecvl.InterpolationType.nearest),
    ecvl.AugRotate([-10, 10])
])
validation_augs = ecvl.SequentialAugmentationContainer([
    ecvl.AugResizeDim(shape, ecvl.InterpolationType.nearest)
])
# Set data augmentations for each partition
dataset_augs = ecvl.DatasetAugmentations([train_augs, validation_augs, None])

# Load data from .yml
dataset = ecvl.DLDataset(data_yml_path, batch_size, dataset_augs, ecvl.ColorType.GRAY)

# Get number of training batches
dataset.SetSplit(ecvl.SplitType.training)
n_train_batches = int(len(dataset.GetSplit()) / batch_size);

# Get number of validation batches
dataset.SetSplit(ecvl.SplitType.validation)
n_validation_batches = int(len(dataset.GetSplit()) / batch_size);

############
# TRAINING #
############

# Placeholder for the batches
x = eddlT.create((batch_size, dataset.n_channels_)+shape)
y = eddlT.create((batch_size, num_classes))

print("Starting training:")
for epoch in range(epochs):
    # Prepare dataset
    dataset.ResetAllBatches()
    dataset.SetSplit(ecvl.SplitType.training)

    eddl.reset_loss(net)  # Reset errors

    # Shuffle training batches
    split = dataset.GetSplit()   
    np.random.shuffle(split)
    dataset.split_.training_ = split

    # Training
    for batch_idx in range(n_train_batches):
        stdout.write(f"Epoch {epoch}/{epochs} (batch {batch_idx:>4}/{n_train_batches}) - ")
        stdout.flush()

        start_time = time() 

        dataset.LoadBatch(x, y)  # Load data

        eddlT.div_(x, 255.0)  # Preprocessing

        eddl.train_batch(net, [x], [y])  # Perform training

        eddl.print_loss(net, batch_idx)

        stdout.write(f"- Elapsed time: {time()-start_time:.2f} seconds\n")
        stdout.flush()
    
    print("Saving model...")
    eddl.save_net_to_onnx_file(net, "padchest_VGG16_adam_lr-0.0001.onnx")

    # Validation
    dataset.SetSplit(ecvl.SplitType.validation)  # Set validation split
    eddl.reset_loss(net)  # Reset errors
    print("Starting validation:")
    for batch_idx in range(n_validation_batches):
        stdout.write(f"Validation - Epoch {epoch}/{epochs} (batch {batch_idx:>4}/{n_validation_batches}) ")
        stdout.flush()

        dataset.LoadBatch(x, y)  # Load data

        eddlT.div_(x, 255.0)  # Preprocessing

        eddl.eval_batch(net, [x], [y])

        eddl.print_loss(net, batch_idx)
        stdout.write("\n")
        stdout.flush()


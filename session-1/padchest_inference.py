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
batch_size = 10
num_classes = 2
shape = (256, 256)
data_yml_path = "../data/padchest.yml"

##############
# LOAD MODEL #
##############
net = eddl.import_net_from_onnx_file("padchest_VGG16_adam_lr-0.0001.onnx")

eddl.build(
    net,
    eddl.adam(0.0001),         # Optimizer
    ["cross_entropy"],         # Losses
    ["categorical_accuracy"],  # Metrics
    eddl.CS_GPU([1]),          # Computing service
    False                      # To avoid reinitializing the weights
)

# Show model architecture
eddl.summary(net)

################
# ECVL DATASET #
################
test_augs = ecvl.SequentialAugmentationContainer([
    ecvl.AugResizeDim(shape, ecvl.InterpolationType.nearest)
])
# Set data augmentations for each partition
dataset_augs = ecvl.DatasetAugmentations([None, None, test_augs])

# Load data from .yml
dataset = ecvl.DLDataset(data_yml_path, batch_size, dataset_augs, ecvl.ColorType.GRAY)

# Get number of training batches
dataset.SetSplit(ecvl.SplitType.test)
n_batches = int(len(dataset.GetSplit()) / batch_size);

############
# TRAINING #
############

# Placeholder for the batches
x = eddlT.create((batch_size, dataset.n_channels_)+shape)
y = eddlT.create((batch_size, num_classes))

print("Starting test:")
for batch_idx in range(n_batches):
    stdout.write(f"Test: batch {batch_idx:>4}/{n_batches} - ")
    stdout.flush()

    start_time = time() 

    dataset.LoadBatch(x, y)  # Load data

    eddlT.div_(x, 255.0)  # Preprocessing

    eddl.eval_batch(net, [x], [y])  # Perform training

    eddl.print_loss(net, batch_idx)

    stdout.write(f"- Elapsed time: {time()-start_time:.2f} seconds\n")
    stdout.flush()

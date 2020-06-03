![DeepHealth logo](/images/dh-workshops.png)

# DeepHealth workshops / hackathons

This project contains material to support the sessions carried out among the **_DeepHealth_** partners to complete different tasks and reach different goals within the **_DeepHealth_** project.

We plan to have several sessions in order to show other partners in the project how to install, configure and use the libraries developed in the **_DeepHealth_** project.
Further support in addition to these sessions will be provided in order to reach all platform providers integrate the libraries into their application platforms.

## First session 2020-05-21 (Thursday) from 9 AM to 11:30 AM

For this first session the following material is available in order to help **_DeepHealth_** partners and any other interested people in preparing the complete pipeline.
What you can see here has been prepared starting from the [_use case pipeline_](https://github.com/deephealthproject/use_case_pipeline) prepared by UNIMORE team.
But the purpose of this alternative is to have an installation of the EDDL in a _conda_ environment named _eddl_ ready to be used in any other project or task.

  * Shell-scripts used to do the installation of the libraries and the pipeline example. Must be executed in the order they appear:
    * [prep-installation-1.sh](session-1/prep-installation-1.sh)
    * [prep-installation-2.sh](session-1/prep-installation-2.sh)
    * [prep-installation-3.sh](session-1/prep-installation-3.sh)
    * [install-eddl-from-source.sh](session-1/install-eddl-from-source.sh)
    * [install-opencv-from-source.sh](session-1/install-opencv-from-source.sh)
    * [install-ecvl-from-source.sh](session-1/install-ecvl-from-source.sh)
    * [build_pipeline_2.sh](session-1/build_pipeline_2.sh)
    * [env-vars.sh](session-1/env-vars.sh) This file contains definition of environment variables used in the in the previous shell-scripts.

  * Video tutorial 1 where Anaconda3, EDDL, OpenCV, ECVL and _use case pipeline_ are installed on a Linux container with Ubuntu 18.04:
    * [Video 1a](http://personales.upv.es/jon/video-1a.mp4) shows how [prep-installation-1.sh](session-1/prep-installation-1.sh) runs.
    * [Video 1b](http://personales.upv.es/jon/video-1b.mp4) shows how [prep-installation-2.sh](session-1/prep-installation-2.sh) runs.
    * [Video 1c](http://personales.upv.es/jon/video-1c.mp4) shows how [prep-installation-3.sh](session-1/prep-installation-3.sh) runs.
    * [Video 1d](http://personales.upv.es/jon/video-1d.mp4) shows how [install-eddl-from-source.sh](session-1/install-eddl-from-source.sh) runs.
    * [Video 1e](http://personales.upv.es/jon/video-1e.mp4) shows how [install-opencv-from-source.sh](session-1/install-opencv-from-source.sh) runs.
    * [Video 1f](http://personales.upv.es/jon/video-1f.mp4) shows how [install-ecvl-from-source.sh](session-1/install-ecvl-from-source.sh) runs.
    * [Video 1g](http://personales.upv.es/jon/video-1g.mp4) shows how [build_pipeline_2.sh](session-1/build_pipeline_2.sh) runs.

  * Video tutorial 2 where code changes are shown in order to use the **YAML** files [Video 2](http://personales.upv.es/jon/Screencast-dataset-description-and-code-changes.mp4)

  * Dataset extracted from [PADCHEST](http://bimcv.cipf.es/bimcv-projects/padchest/) split in two ZIP files:
    * [Part 1](https://intercambio.upv.es/download.php?id=fb195897e663b329b614923f5c29acf3)
    * [Part 2](https://intercambio.upv.es/download.php?id=016b04d7fb480fe5c00943080c73b449)

  * Alternative installation procedure for non-privileged users when **conda** is already available in the Linux system (no videos were prepared):
    * [prep-installation.sh](session-1-no-superuser/prep-installation-3.sh)
    * [install-eddl-from-source.sh](session-1-no-superuser/install-eddl-from-source.sh)
    * [install-opencv-from-source.sh](session-1-no-superuser/install-opencv-from-source.sh)
    * [install-ecvl-from-source.sh](session-1-no-superuser/install-ecvl-from-source.sh)
    * [build_pipeline_2.sh](session-1-no-superuser/build_pipeline_2.sh)
    * [env-vars.sh](session-1-no-superuser/env-vars.sh) This file contains definition of environment variables used in the in the previous shell-scripts.

    The main difference is in the first step, now only one shell-script.
    There are small differences in the other files, the component **calib3d** has been added to **OpenCV**, this solved the
    problem with the method **cv::initDistortRectifyMap()** when compiling the **ECVL**.

    **IMPORTANT**: if a **conda** installation is not available in the system and the _base_ **conda** environment is not activated before starting
    the process, then the execution of the shell-scripts will fail.



#### Proposed schedule for the first session (can be modified if required):

  * Presentations:

    1. UC12 & Pneumothorax in C++ (UNIMORE)
      * Pneumothorax: demo for downloading the dataset, download the masks (ground truth),
        cloning the pipeline repository, compile and execute the setup program,
        which copies the masks into the right folders, compile and execute the training program.
        [Slides](https://github.com/deephealthproject/workshops/raw/master/session-1/20200521%20Hackaton%20-%20Pneumothorax%20UNIMORE.pptx)

    2. Padchest in C++ (UPV)
       [Slides](session-1/c++_pipeline_presentation_final.pdf)

    3. UC12 & Pneumothorax in Python (UNIMORE)

    4. Padchest in Python (UPV)
      * [Slides](session-1/python_pipeline_presentation_padchest.pdf) 
      * [padchest_train.py](session-1/padchest_train.py)
      * [padchest_inference.py](session-1/padchest_inference.py)
      * [Installation bitacora](session-1/bitacora_installation_Python_pipeline.txt)

  * Configuration issues and programming:

    * Testing pipelines run on partners’ computers and giving the necessary support
  
  
## Second session 2020-06-04 (Thursday) from 9 AM to 11:30 AM

  * Presentation of results

  * Presentation and demo of the back-end 

  * Presentation and demo of the front-end 

  * Configuration and programming issues (if required by any partner)


## Third session (tentative date) 2020-06-18 (Thursday) from 9 AM to 11:30 AM

  * T.B.A. it will be HPC+Cloud oriented 

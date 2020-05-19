![DeepHealth logo](/images/dh-workshops.png)

# DeepHealth workshops / hackathons

This project contains material to support the sessions carried out among the **_DeepHealth_** partners to complete different tasks and reach different goals within the **_DeepHealth_** project.

We plan to have several sessions in order to show other partners in the project how to install, configure and use the libraries developed in the **_DeepHealth_** project.
Further support in addition to these sessions will be provided in order to reach all platform providers integrate the libraries into their application platforms.

# First session 2020-05-21 (Thursday) from 8 AM to 11 AM

For this first session the following material is available in order to help **_DeepHealth_** partners and any other interested people in preparing the complete pipeline:

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

  * Video tutorial 2 where code changes are shown in order to use the **YAML** files [Video2](http://personales.upv.es/jon/Screencast-dataset-description-and-code-changes.mp4)

  * Dataset extracted from [PADCHEST](http://bimcv.cipf.es/bimcv-projects/padchest/) split in two ZIP files:
    * [Part 1](https://intercambio.upv.es/download.php?id=fb195897e663b329b614923f5c29acf3)
    * [Part 2](https://intercambio.upv.es/download.php?id=016b04d7fb480fe5c00943080c73b449)

Proposed schedule for the first session (can be modified if required):

    * Presentations:

        1. UC12 & Pneumothorax in C++ (UNIMORE)
            * Pneumothorax: demo for downloading the dataset, download the masks (ground truth),
              cloning the pipeline repository, compile and execute the setup program,
              which copies the masks into the right folders,
              compile and execute the training program.

        2. Padchest in C++ (UPV)

        3. UC12 & Pneumothorax in Python (UNIMORE)

        4. Padchest in Python (UPV)

    * Configuration issues and programming:

        * Testing pipelines run on partners’ computers and giving the necessary support
  
  
# Second session (tentative date) 2020-06-04 (Thursday) from 8 AM to 11 AM
    * T.B.A.

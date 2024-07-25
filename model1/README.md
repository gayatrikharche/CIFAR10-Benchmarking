# **Method 1: Small Dataset (150 MB) - CIFAR-10 with ResNet Architecture**

## **Overview**

This document outlines the process for using Method 1 to train a ResNet architecture on the CIFAR-10 dataset, a popular dataset for image classification tasks. The workflow involves data acquisition, extraction, model training, and cleanup using HTCondor for job submission and resource management.

## **1. Data Access and Processing**

### **Data Flow and Acquisition**

The CIFAR-10 dataset is obtained from the Open Science Data Federation (OSDF) via a Python script that sends an HTTP GET request. An authorization token is used for authentication, and the dataset is downloaded as a compressed `.tar.gz` file. The following steps outline the entire data flow:

1. **Data Acquisition:** 
    - Download the CIFAR-10 dataset from OSDF using an HTTP GET request.
    - The dataset is saved locally on the compute node as a `.tar.gz` file.

2. **Data Extraction:** 
    - The wrapper script extracts the tarball and populates a directory named `data` with the dataset files.

3. **Model Training:** 
    - The PyTorch model script is executed to train the ResNet model using the CIFAR-10 dataset.

4. **Cleanup:** 
    - After training, the wrapper script deletes the `data` directory to free up storage space on the compute node.

5. **Job Submission and Resource Management:** 
    - HTCondor manages the job submission, specifying the required resources and handling file transfers. It ensures the necessary files are available on the compute node and manages the execution of the PyTorch script.

6. **Execution Monitoring:** 
    - Logs are generated during execution to capture the job’s progress, output, and errors, aiding in debugging and monitoring.

## **2. Wrapper Script**

The wrapper script orchestrates the data preparation and model training process. It performs the following tasks:

1. **Extract Dataset:** Decompresses the CIFAR-10 dataset tarball and creates a `data` directory.
2. **Run Model Training:** Executes the PyTorch model script to train the ResNet model on the extracted dataset.
3. **Cleanup:** Deletes the `data` directory after training to reclaim storage space.

## **3. HTCondor Submit File**

The HTCondor submit file configures the job submission process and includes:

1. **Singularity Image:** Specifies the use of a Singularity container image containing PyTorch.
2. **Log Files:** Defines paths for log, error, and output files.
3. **Executable and Arguments:** Sets the executable (wrapper script) and its arguments.
4. **File Transfers:** Manages the transfer of necessary files (e.g., Python script, dataset) to the compute node.
5. **Resource Requests:** Requests computational resources such as CPUs, GPUs, memory, and disk space.
6. **Job Execution:** Ensures that the job is executed with the specified resources and that all necessary files are available on the compute node.

## **4. PyTorch Script**

The PyTorch script (cifar10_resnet.py) implements a ResNet architecture for training on the CIFAR-10 dataset. Below is a description of the script:

### **Description**

The script defines and trains a Residual Neural Network (ResNet) using PyTorch. The model includes several convolutional layers with residual blocks followed by fully connected layers. The script handles the following tasks:

1. **Model Definition:** The ResNet class defines the network architecture with convolutional layers and residual blocks.
2. **Training Function:** The train function performs the training of the model using the provided data loader and optimizer.
3. **Testing Function:** The test function evaluates the model on the test dataset.
4. **Main Function:** The main function parses command-line arguments, sets up data loaders, initializes the model and optimizer, and runs the training and testing processes.

### **Job Submission and Resource Management:**

HTCondor manages the job submission (condor_sumbit), ensuring the necessary files and resources are available on the compute node. It handles file transfers, specifies resource requirements, and monitors the job's execution. Logs are generated to capture the job’s progress, output, and errors, aiding in debugging and monitoring the training process.

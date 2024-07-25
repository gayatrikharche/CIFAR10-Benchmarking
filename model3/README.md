# **Method 3: Direct Data Fetching with OSDF Protocol - CIFAR-10 with ResNet Architecture**

## **Overview**

This document outlines the process for training a ResNet architecture on the CIFAR-10 dataset using Method 3. This method involves directly fetching the dataset from the Open Science Data Federation (OSDF) using the OSDF protocol. The workflow includes data access, model training, and cleanup, with HTCondor managing job submission and resource allocation.

### **1. Data Access and Processing**

#### **Data Flow and Acquisition**

In Method 3, the CIFAR-10 dataset is accessed directly from OSDF using the OSDF protocol. This method simplifies the data handling process by fetching the data in its required format directly from the OSDF storage.

1. **Data Acquisition:**
   - The CIFAR-10 dataset is accessed directly from OSDF using the OSDF protocol. This eliminates the need for intermediate steps such as downloading and extracting a tarball.

2. **Data Handling:**
   - The dataset is transferred to the compute node using the OSDF protocol as specified in the HTCondor submit file.

3. **Model Training:**
   - The PyTorch model script is executed to train a ResNet model on the dataset fetched directly from OSDF.

4. **Cleanup:**
   - After model training is completed, the wrapper script manages cleanup by removing any temporary files or data to free up storage space on the compute node.

5. **Job Submission and Resource Management:**
   - HTCondor is responsible for job submission, specifying the required computational resources, and managing file transfers. It ensures that all necessary files are available on the compute node and oversees the execution of the PyTorch script.

6. **Execution Monitoring:**
   - Logs are generated during execution to capture the job’s progress, output, and errors. These logs are crucial for debugging and monitoring the training process.

### **2. Wrapper Script**

The wrapper script performs the following tasks:

1. **Run Model Training:** Executes the PyTorch model script to train the ResNet model using the dataset directly accessed from OSDF.
2. **Cleanup:** Manages post-training cleanup by removing any temporary files or data to reclaim storage space.

### **3. HTCondor Submit File**

The HTCondor submit file is configured to manage job submission and includes:

1. **Singularity Image:** Specifies the use of a Singularity container image that contains the PyTorch environment.
2. **Log Files:** Defines paths for log, error, and output files to record details of the job’s execution.
3. **Executable and Arguments:** Sets the executable (wrapper script) and its arguments.
4. **File Transfers:** Transfers essential files to the compute node, including the Python script and the CIFAR-10 dataset, using the OSDF protocol.
5. **Resource Requests:** Requests computational resources such as CPUs, GPUs, memory, and disk space to ensure adequate resources for job execution.
6. **GPU Requirement:** Ensures that the compute node has a compatible CUDA driver for GPU support.
7. **Job Execution:** Configures HTCondor to execute the job with the specified resources and manage file transfers appropriately.

### **4. PyTorch Script**

The PyTorch script (cifar10_resnet-3.py) implements a ResNet architecture for training on the CIFAR-10 dataset. The script includes:

1. **Model Definition:** Defines the ResNet architecture with convolutional layers and residual blocks.
2. **Training Function:** Manages the training process using the provided data loader and optimizer.
3. **Testing Function:** Evaluates the model's performance on the test dataset.
4. **Main Function:** Handles command-line argument parsing, sets up data loaders, initializes the model and optimizer, and executes the training and testing processes.

### **5. Job Submission and Resource Management**

HTCondor handles the job submission process by ensuring that all necessary files and resources are available on the compute node. It manages file transfers, specifies resource requirements, and monitors job execution. The generated logs provide insights into the job’s progress and assist with debugging and monitoring.

### **6. Advantages**
Method 3 offers several advantages over Methods 1 and 2, including streamlined data handling, reduced disk space usage, simplified workflow, improved data integrity, efficient data transfer, and better integration with OSDF. These benefits make Method 3 particularly suited for large datasets and complex workflows, enhancing overall efficiency and reliability.


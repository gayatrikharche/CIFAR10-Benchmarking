# **Method 2: Direct Data Fetching from OSDF - CIFAR-10 with ResNet Architecture**

### **Overview**

This document details the process for training a ResNet architecture on the CIFAR-10 dataset using Method 2. This method streamlines the data access process by directly fetching the dataset from the Open Science Data Federation (OSDF) via HTTP, avoiding the need to download and manually extract a tarball. The workflow includes direct data access, model training, and cleanup, with job submission and resource management handled by HTCondor.

### **1. Data Access and Processing**

#### **Data Flow and Acquisition**

In Method 2, the CIFAR-10 dataset is fetched directly from OSDF using an HTTP GET request. The steps involved are:

1. **Data Acquisition:**
   - The CIFAR-10 dataset is accessed directly from OSDF via an HTTP request. This approach eliminates the need for pre-downloading and extracting a tarball.

2. **Data Extraction:**
   - There is no separate extraction step since the data is directly accessed in a usable format.

3. **Model Training:**
   - The PyTorch model script is executed to train a ResNet model on the dataset. The script handles the training process based on the data fetched directly from OSDF.

4. **Cleanup:**
   - After model training, the wrapper script manages cleanup by removing temporary data or files to free up storage space on the compute node.

5. **Job Submission and Resource Management:**
   - HTCondor manages job submission, specifying the required computational resources and handling file transfers. It ensures that all necessary files are available on the compute node and manages the execution of the PyTorch script.

6. **Execution Monitoring:**
   - During execution, logs are generated to capture the job’s progress, output, and errors, which are crucial for debugging and monitoring.

### **2. Wrapper Script**

The wrapper script is responsible for managing the following tasks:

1. **Run Model Training:** : Executes the PyTorch model script to train the ResNet model using the dataset fetched directly from OSDF.

2. **Cleanup:** : Handles post-training cleanup by removing any temporary files or data to reclaim storage space.

### **3. HTCondor Submit File**

The HTCondor submit file is configured to manage job submission and includes:

1. **Singularity Image:** Specifies the use of a Singularity container image that contains the required PyTorch environment.

2. **Log Files:** Defines paths for log, error, and output files where the job's execution details are recorded.

3. **Executable and Arguments:** Sets the executable (wrapper script) and its arguments.

4. **File Transfers:** Manages the transfer of essential files, including the Python script and dataset, to the compute node.

5. **Resource Requests:** Requests computational resources such as CPUs, GPUs, memory, and disk space to ensure the job runs effectively.

6. **GPU Requirement:** Ensures that the compute node has a compatible CUDA driver for GPU support.

7. **Job Execution:** Configures HTCondor to execute the job with the specified resources and to manage file transfers appropriately.

### **4. PyTorch Script**

The PyTorch script (cifar10_resnet.py) implements a ResNet architecture for training on the CIFAR-10 dataset. The script includes:

1. **Model Definition:** Defines the ResNet architecture with convolutional layers and residual blocks.

2. **Training Function:** Manages the training of the model using the provided data loader and optimizer.

3. **Testing Function:** Evaluates the model's performance on the test dataset.

4. **Main Function:** Handles command-line argument parsing, data loader setup, model and optimizer initialization, and the execution of training and testing processes.

### **5. Job Submission and Resource Management**

HTCondor manages the job submission process, including ensuring that all necessary files and resources are available on the compute node. It oversees file transfers, specifies resource requirements, and monitors job execution. The logs generated provide insights into the job's progress and help with debugging and monitoring.

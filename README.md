# CIFAR-10 Benchmarking: Data Access Methods on OSG( Open Science Grid)

This document describes three methods for benchmarking CIFAR-10 dataset training using PyTorch. Each method involves different strategies for data access and management, leveraging HTCondor for job submission and resource management.

## Method 1: HTTP Protocol

### Overview
This method involves downloading the CIFAR-10 dataset as a compressed `.tar.gz` file using HTTP. The dataset is extracted locally before model training begins.

### Steps
1. **Data Acquisition:** Download the CIFAR-10 dataset from the Open Science Data Federation (OSDF) using an HTTP GET request.
2. **Data Extraction:** Extract the dataset from the `.tar.gz` file using a wrapper script, organizing the files into a directory named `data`.
3. **Model Training:** Use the extracted dataset to train a PyTorch model. The training process is managed by the wrapper script.
4. **Cleanup:** Remove the data directory post-training to free up storage space.

### Data Flow
1. **Download** the dataset from OSDF as a `.tar.gz` file.
2. **Extract** the tarball to a `data` directory.
3. **Train** the PyTorch model using the extracted dataset.
4. **Clean Up** by deleting the data directory.

### HTCondor Configuration
- **Singularity Image:** Specify the container with PyTorch.
- **File Transfers:** Transfer the Python script and dataset.
- **Resource Requests:** Configure required resources such as CPUs, GPUs, memory, and disk space.

---

## Method 2: HTTP Protocol (Directly Fetching Data)

### Overview
This method fetches the dataset directly via HTTP and processes it similarly to Method 1 but simplifies data access.

### Steps
1. **Data Acquisition:** Download the CIFAR-10 dataset from OSDF using HTTP directly in the job script.
2. **Data Extraction:** The dataset is extracted and used for model training in the same way as Method 1.
3. **Model Training:** Train the model using the extracted dataset.
4. **Cleanup:** Clean up the data directory after training.

### Data Flow
1. **Fetch** the dataset via HTTP directly in the job script.
2. **Extract** the dataset locally.
3. **Train** the PyTorch model using the dataset.
4. **Clean Up** by removing the data directory.

### HTCondor Configuration
- **Singularity Image:** Use a container with PyTorch.
- **File Transfers:** Transfer Python script and dataset URL.
- **Resource Requests:** Define required computational resources.

---

## Method 3: OSDF Protocol (Direct Data Access)

### Overview
This method accesses the CIFAR-10 dataset directly using the OSDF protocol, avoiding the need for intermediate downloads or extractions.

### Steps
1. **Data Acquisition:** Directly access the dataset from OSDF using the OSDF protocol.
2. **Data Handling:** Stream the dataset directly without downloading it.
3. **Model Training:** Train the model using the directly accessed data.
4. **Cleanup:** No need for cleanup as data is not stored locally.

### Data Flow
1. **Access** the dataset directly using OSDF protocol.
2. **Stream** the dataset for model training.
3. **Train** the PyTorch model.
4. **No Cleanup** required as data is not stored locally.

### HTCondor Configuration
- **Singularity Image:** Specify the container image with PyTorch.
- **File Transfers:** Directly access data using OSDF protocol.
- **Resource Requests:** Configure resources such as CPUs, GPUs, memory, and disk space.

### Advantages of Method 3
- **Efficiency:** Directly accesses data without intermediate storage.
- **Simplified Workflow:** Reduces complexity by eliminating download and extraction steps.
- **Storage Savings:** Avoids local storage of large datasets, minimizing storage requirements on the compute node.

---

## Conclusion

Each method provides a different approach to handling the CIFAR-10 dataset for benchmarking:

- **Method 1:** Traditional download and extraction with local handling.
- **Method 2:** Direct fetching with HTTP, simplifying the process.
- **Method 3:** Direct data access using OSDF protocol, streamlining data handling and reducing local storage requirements.

#!/bin/bash
echo "Hello OSPool from Job $1 running on $(hostname)"

# Untar the test and training data
tar zxf cifar-10-python.tar.gz
mkdir data
mv cifar-10-batches-py data

# Run the PyTorch model
python cifar10-Resnet-3.py --save-model --epochs 20

# Remove the data directory
rm -r data

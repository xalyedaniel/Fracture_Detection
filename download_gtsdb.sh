#!/bin/bash

pip install gdown
gdown 1ns7VY692gLbUKOhkn8zVyzxa9vsZGVbh # Stored on Google Drive for ease of access, but is publicly available on Kaggle
mkdir GTSDB
unzip GTSDB.zip -d ./GTSDB
rm GTSDB.zip

#!/bin/bash

pip install gdown
gdown 1bAP9mzo2mGnqbydAMmb9B97KyfjVelj6 # Stored on Google Drive for ease of access, but is publicly available on Kaggle
mkdir GTSRB
unzip GTSRB.zip -d ./GTSRB
rm GTSRB.zip

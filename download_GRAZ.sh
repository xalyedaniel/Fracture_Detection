#!/bin/bash

# IMPORTANT: Run from Fracture_Detection (root dir of project)

# Get File Structure
curl -L https://figshare.com/ndownloader/files/34268819 -o GRAZ_dset.zip
unzip GRAZ_dset.zip -d ./GRAZ_dset
rm -f GRAZ_dset.zip
echo "done with file structure!"
curl -L https://figshare.com/ndownloader/files/34268828 -o ./GRAZ_dset/yolov5/images/images1.zip
unzip ./GRAZ_dset/yolov5/images/images1.zip -d ./GRAZ_dset/yolov5/images/
rm -f ./GRAZ_dset/yolov5/images/images1.zip
echo "done with zip 1!"
curl -L https://figshare.com/ndownloader/files/34268849 -o ./GRAZ_dset/yolov5/images/images2.zip
unzip ./GRAZ_dset/yolov5/images/images2.zip -d ./GRAZ_dset/yolov5/images/
rm -f ./GRAZ_dset/yolov5/images/images2.zip
curl -L https://figshare.com/ndownloader/files/34268864 -o ./GRAZ_dset/yolov5/images/images3.zip
unzip ./GRAZ_dset/yolov5/images/images3.zip -d ./GRAZ_dset/yolov5/images/
rm -f ./GRAZ_dset/yolov5/images/images3.zip
curl -L https://figshare.com/ndownloader/files/34268891 -o ./GRAZ_dset/yolov5/images/images4.zip
unzip ./GRAZ_dset/yolov5/images/images4.zip -d ./GRAZ_dset/yolov5/images/
rm -f ./GRAZ_dset/yolov5/images/images4.zip

# Dataset CSV: May have to load that manually
# curl -L https://figshare.com/ndownloader/files/35026432 -0 ./GRAZ_dset/yolov5/datasets/datasets.zip
# unzip ./GRAZ_dset/yolov5/datasets/datasets.zip -d ./GRAZ_dset/yolov5/datasets/
# rm -f ./GRAZ_dset/yolov5/datasets/datasets.zip

python split_graz.py
python imgaug.py --input_img ./GRAZ_dset/data/images/train/ --output_img ./GRAZ_dset/data/images/train_aug/ --input_label ./GRAZ_dset/data/labels/train/ --output_label ./GRAZ_dset/data/labels/train_aug/

echo "done!"
tput bel
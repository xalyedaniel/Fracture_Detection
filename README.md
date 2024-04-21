# YOLOv8-AM: YOLOv8 with Attention Mechanisms for Pediatric Wrist Fracture Detection


## Requirements
* MacOS (use MPS GPU, need enough memory though), Linux (Ubuntu) or Windows10/11
* Python = 3.9 or 3.10
* Pytorch = 1.13.1
* NVIDIA GPU + CUDA CuDNN
* FracAtlas experiments trained on NVIDIA L40S using BU SCC

## Environment
```
  pip install -r requirements.txt
```

## Dataset
### Download the dataset
* You can download the GRAZPEDWRI-DX Dataset on this [Link](https://figshare.com/articles/dataset/GRAZPEDWRI-DX/14825193).
### Split the dataset
* To split the dataset into training set, validation set, and test set, you should first put the image and annotatation into `./GRAZPEDWRI-DX/data/images`, and `./GRAZPEDWRI-DX/data/labels`.
* And then you can split the dataset using the following step:
  ```
    python split.py
  ```
* The dataset is divided into training, validation, and testing set (70:20:10 %) according to the key `patient_id` stored in `dataset.csv`. 

The script will create 3 files: `train_data.csv`, `valid_data.csv`, and `test_data.csv` with the same structure of `dataset.csv`.
                      
### Data Augmentation
* Data augmentation of the training set using the addWeighted function doubles the size of the training set.
```
  python imgaug.py --input_img ./GRAZPEDWRI-DX/data/images/train/ --output_img ./GRAZPEDWRI-DX/data/images/train_aug/ --input_label ./GRAZPEDWRI-DX/data/labels/train/ --output_label ./GRAZPEDWRI-DX/data/labels/train_aug/
```



### Model Training
* We have provided a training set, test set and validation set containing a single image that you can run directly by following the steps in the example below.
* Before training the model, make sure the path to the data in the `./GRAZPEDWRI-DX/data/meta.yaml` file is correct.
```
  # patch: /path/to/GRAZPEDWRI-DX/data
  path: 'E:/GRAZPEDWRI-DX/data'
  train: 'images/train_aug'
  val: 'images/valid'
  test: 'images/test'
```

* Arguments

You can set the value in the `./ultralytics/cfg/default.yaml`.

| Key | Value | Description |
| :---: | :---: | :---: |
| model | None | path to model file, i.e. yolov8m.yaml, yolov8m_ECA.yaml |
| data | None | path to data file, i.e. coco128.yaml, meta.yaml |
| epochs | 20 | number of epochs to train for, i.e. 100, 150 |
| patience | 50 | epochs to wait for no observable improvement for early stopping of training |
| batch | 16 | number of images per batch (-1 for AutoBatch), i.e. 16, 32, 64 |
| imgsz | 640 | size of input images as integer, i.e. 640, 1024 |
| save | True | save train checkpoints and predict results |
| device | 0 | device to run on, i.e. cuda device=0 or device=0,1,2,3 or device=cpu |
| workers | 8 | number of worker threads for data loading (per RANK if DDP) |
| pretrained | True | (bool or str) whether to use a pretrained model (bool) or a model to load weights from (str) |
| optimizer | 'auto' | optimizer to use, choices=SGD, Adam, Adamax, AdamW, NAdam, RAdam, RMSProp, auto |
| resume | False | resume training from last checkpoint |
| lr0 | 0.01 | initial learning rate (i.e. SGD=1E-2, Adam=1E-3) |
| momentum | 0.937 | 	SGD momentum/Adam beta1 |
| weight_decay | 0.0005 | optimizer weight decay 5e-4 |
| val | True | validate/test during training |

* Traning Steps (yolov8m):
```
  python start_train.py --model ./ultralytics/cfg/models/v8/yolov8m.yaml --data_dir ./GRAZPEDWRI-DX/data/meta.yaml
```
* Traning Steps (yolov8m_ECA):
```
  python start_train.py --model ./ultralytics/cfg/models/v8/yolov8m_ECA.yaml --data_dir ./GRAZPEDWRI-DX/data/meta.yaml
```
* Traning Steps (yolov8m_SA):
```
  python start_train.py --model ./ultralytics/cfg/models/v8/yolov8m_SA.yaml --data_dir ./GRAZPEDWRI-DX/data/meta.yaml
```
* Traning Steps (yolov8m_GAM):
```
  python start_train.py --model ./ultralytics/cfg/models/v8/yolov8m_GAM.yaml --data_dir ./GRAZPEDWRI-DX/data/meta.yaml
```
* Traning Steps (yolov8m_ResBlock_CBAM):
```
  python start_train.py --model ./ultralytics/cfg/models/v8/yolov8m_ResBlock_CBAM.yaml --data_dir ./GRAZPEDWRI-DX/data/meta.yaml
```

### FracAtlas Dataset
To download the FracAtlas dataset, run

```bash
./download_fracatlas.sh
```

Then move the meta.yaml file to the data folder

```bash
mv meta.yaml FracAtlas/
```

Then to split and augment the data, run:

```bash
python FracAtlas_Split.py
./FracAtlas_Aug.sh
```

Then you can begin training with the following command:

```bash
python start_train.py --model ./ultralytics/cfg/models/v8/yolov8m.yaml --data_dir ./FracAtlas/meta.yaml
```

Here's a look at the dataset tree:

```
FracAtlas
├── Annotations
│   ├── COCO JSON
│   │   └── COCO_fracture_masks.json
│   ├── PASCAL VOC
│   ├── VGG JSON
│   │   └── VGG_fracture_masks.json
│   └── YOLO
├── Utilities
│   ├── Fracture Split
│   │   ├── test.csv
│   │   ├── train.csv
│   │   └── valid.csv
│   ├── coco2yolo.ipynb
│   └── yolo2voc.ipynb
├── YOLO_FracSplit
│   ├── images
│   │   ├── test
│   │   ├── train
│   │   ├── train_aug
│   │   └── val
│   └── labels
│       ├── test
│       ├── train
│       ├── train_aug
│       ├── train_aug.cache
│       ├── val
│       └── val.cache
├── dataset.csv
├── images
│   ├── Fractured
│   └── Non_fractured
└── meta.yaml
```

```
 ultralytics
    └── cfg
    │    ├── modules/v8
    │         ├── yolov8_A2.yaml
    │         └── ...
    └── nn
         ├── modules
         │    ├── conv.py
         │    ├── __init__.py
         │    └── ...
         │    
         └── tasks.py
```

Add attention models to basic yolov8. 

add code of addtetion models under ``\ultralytics\nn\modules\conv.py``

Register and import the model under ``ultralytics\nn\modules\__init__.py``

Import and invocation the model under ``\ultralytics\nn\tasks.py`` and it's ``parse_model``

create ``.yaml`` file under ``\ultralytics\cfg\models\v8``

## If getting error ``keyerror:"example-model"``

you need copy and paste your ``conv.py`` ``__init__.py`` and ``tasks.py`` to the ultralytics package you used in your python environment and replace same .py file

For expample mine is under ``python39/Lib/sit-packages/ultralytics/nn/modules/``

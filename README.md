# -Fracture_Detection

This branch adds the FracAtlas Dataset to the Fracture Detection project, in order to evaluate how well the model performs on another dataset.

## Setup

To run the code, make sure you run

```bash
pip install -r requirements.txt
```

To download the dataset, run

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

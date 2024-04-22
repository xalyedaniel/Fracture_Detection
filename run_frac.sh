#!/bin/bash

python change_name.py fraconly_yolov8m_50
python start_train.py --model ./ultralytics/cfg/models/v8/yolov8m.yaml --data_dir ./FracAtlas/meta.yaml

python change_name.py fraconly_yolov8m_ECA_50
python start_train.py --model ./ultralytics/cfg/models/v8/yolov8m_ECA.yaml --data_dir ./FracAtlas/meta.yaml

python change_name.py fraconly_yolov8m_SA_50
python start_train.py --model ./ultralytics/cfg/models/v8/yolov8m_SA.yaml --data_dir ./FracAtlas/meta.yaml

python change_name.py fraconly_yolov8m_GAM_50
python start_train.py --model ./ultralytics/cfg/models/v8/yolov8m_GAM.yaml --data_dir ./FracAtlas/meta.yaml

python change_name.py fraconly_yolov8m_ResBlock_CBAM_50
python start_train.py --model ./ultralytics/cfg/models/v8/yolov8m_ResBlock_CBAM.yaml --data_dir ./FracAtlas/meta.yaml

python change_name.py fraconly_yolov8m_A2_50
python start_train.py --model ./ultralytics/cfg/models/v8/yolov8m_A2.yaml --data_dir ./FracAtlas/meta.yaml

python change_name.py fraconly_yolov8m_MLCA_50
python start_train.py --model ./ultralytics/cfg/models/v8/yolov8m_MLCA.yaml --data_dir ./FracAtlas/meta.yaml
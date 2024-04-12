import os
import random
import shutil

# Define the paths
image_dir = './FracAtlas/images/Fractured'
annotation_dir = './FracAtlas/Annotations/YOLO'
output_dir = './FracAtlas/YOLO_FracSplit'

# Create the output directory if it doesn't exist
os.makedirs(output_dir, exist_ok=True)

# Create images and labels directories
images_dir = os.path.join(output_dir, 'images')
labels_dir = os.path.join(output_dir, 'labels')
os.makedirs(images_dir, exist_ok=True)
os.makedirs(labels_dir, exist_ok=True)

# Get the list of image files
image_files = os.listdir(image_dir)

# Shuffle the image files
random.shuffle(image_files)

# Calculate the number of files for each split
num_files = len(image_files)
train_size = int(0.7 * num_files)
val_size = int(0.2 * num_files)
test_size = num_files - train_size - val_size

# Split the image files
train_files = image_files[:train_size]
val_files = image_files[train_size:train_size+val_size]
test_files = image_files[train_size+val_size:]

# Move the annotation files to the labels directory
for split, files in [('train', train_files), ('val', val_files), ('test', test_files)]:
    split_labels_dir = os.path.join(labels_dir, split)
    os.makedirs(split_labels_dir, exist_ok=True)
    for file in files:
        annotation_file = file.replace('.jpg', '.txt')
        shutil.copy(os.path.join(annotation_dir, annotation_file), split_labels_dir)

# Move the image files to the images directory
for split, files in [('train', train_files), ('val', val_files), ('test', test_files)]:
    split_images_dir = os.path.join(images_dir, split)
    os.makedirs(split_images_dir, exist_ok=True)
    for file in files:
        shutil.copy(os.path.join(image_dir, file), split_images_dir)

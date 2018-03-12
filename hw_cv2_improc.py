
import cv2

data_root = "data.mb/unzip/vision.middlebury.edu/stereo/data/scenes2014/datasets"
img = cv2.imread(data_root + "/Adirondack-imperfect/im0.png.H.png")
print(img)

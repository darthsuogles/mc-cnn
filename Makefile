# This is the installation directory under the container
TORCH_INSTALL_DIR=/home/drgscl/app/torch/distro/install

PREFIX = $(TORCH_INSTALL_DIR)
CFLAGS = -I$(PREFIX)/include/THC -I$(PREFIX)/include/TH -I$(PREFIX)/include \
	-I$(PWD)/third_party `pkg-config --cflags opencv`
LDFLAGS_NVCC = -L$(PREFIX)/lib -Xlinker -rpath,$(PREFIX)/lib -lluaT -lTHC -lTH -lpng
LDFLAGS_CPP = -L$(PREFIX)/lib -lluaT -lTH `pkg-config --libs opencv`

all: libadcensus.so libcv.so

libadcensus.so: adcensus.cu SpatialLogSoftMax.cu
	nvcc -arch sm_35 -O3 -DNDEBUG --compiler-options '-fPIC' -o libadcensus.so --shared adcensus.cu $(CFLAGS) $(LDFLAGS_NVCC)

libcv.so: cv.cpp
	g++ -fPIC -o libcv.so -shared cv.cpp $(CFLAGS) $(LDFLAGS_CPP)

clean:
	rm -f libadcensus.so libcv.so

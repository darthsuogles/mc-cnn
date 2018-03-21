FROM phissenschaft/torch7:xenial-cuda9-cudnn7
MAINTAINER phissenschaft@gmail.com

USER drgscl
ENV SPACK_ROOT=/home/drgscl/spack

COPY pkg_install.sh .
RUN ./pkg_install.sh python
RUN ./pkg_install.sh py-numpy
RUN ./pkg_install.sh opencv@2.4.13.2 +highgui +imgproc +jasper +png +openmp +python
RUN ./pkg_install.sh image-magick

RUN rm -rf /tmp/drgscl/spack-stage

RUN touch /home/drgscl/.zshrc.mod \
    && echo 'echo "[init] patching spack modules"; \
    spack unload opencv@3.3.0; \
    spack load opencv@2.4.13.2 +highgui +imgproc +python; \
    ' >> /home/drgscl/.zshrc.mod

# Must switch back to root so that we can `gosu`
USER root

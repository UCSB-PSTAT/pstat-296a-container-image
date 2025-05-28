FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN conda install -y -c conda-forge \
    r-rmarkdown\
    r-fitdistrplus\
    r-readxl\
    r-actuar\
    r::r-datacombine

# Disable downloads from JupyterHub. 
RUN jupyter labextension disable @jupyterlab/docmanager-extension:download ; \
    jupyter labextension disable @jupyterlab/filebrowser-extension:download

USER $NB_USER


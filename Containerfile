FROM registry.cloud.college.ucsb.edu/ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN conda install -y -c conda-forge \
    r-rmarkdown\
    r-fitdistrplus\
    r-readxl\
    r-actuar

# Install from GitHub to avoid R Downgrade:
RUN R -e "pak::pak('christophergandrud/DataCombine')"

# Disable downloads from JupyterHub. 
RUN jupyter labextension disable @jupyterlab/docmanager-extension:download ; \
    jupyter labextension disable @jupyterlab/filebrowser-extension:download

USER $NB_USER


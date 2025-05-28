FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

RUN conda install -y -c conda-forge \
    r::r-datacombine

RUN R -e "install.packages(c('rmarkdown','fitdistrplus','readxl','actuar'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

# Disable downloads from JupyterHub. 
RUN jupyter labextension disable @jupyterlab/docmanager-extension:download ; \
    jupyter labextension disable @jupyterlab/filebrowser-extension:download

USER $NB_USER


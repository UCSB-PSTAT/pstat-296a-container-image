FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

#RUN R -e "install.packages(c('<library>', '<library>'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

# Disable downloads from JupyterHub. 
jupyter labextension disable @jupyterlab/docmanager-extension:download
jupyter labextension disable @jupyterlab/filebrowser-extension:download

USER $NB_USER


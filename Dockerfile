FROM r-base:3.6.0

# Metadata
LABEL base.image="rna_gene_labels:v.20200929"
LABEL version="1"
LABEL software="RNA gene label"
LABEL software.version="1.0.0"
LABEL description="Add a gene name to RNA-seq matrix"
LABEL tags="Gene expression"

# Maintainer
MAINTAINER DaveLab <lab.dave@gmail.com>

# update the OS related packages
RUN apt-get update -y && apt-get install -y \
    build-essential \
    curl \
    vim \
    less \
    wget \
    unzip \
    cmake \
    gcc-8-base \
    libmpx2 \
    libgcc-8-dev \
    libc6-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    python3 \
    gawk \
    python3-pip \
    bzip2 \
    git

# install R required dependencies
RUN R --vanilla -e 'install.packages(c("data.table"), repos="http://cran.us.r-project.org")'
RUN R --vanilla -e 'BiocManager::install("AnnotationDbi","org.Hs.eg.db")


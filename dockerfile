FROM condaforge/mambaforge:latest
LABEL io.github.snakemake.containerized="true"
LABEL io.github.snakemake.conda_env_hash="fc5a60450b651fc2960f4f352f68fda27534d1b1ac63266f1320acb179d4ec8a"

# Step 1: Retrieve conda environments

# Conda environment:
#   source: https://github.com/snakemake/snakemake-wrappers/raw/v1.21.1/bio/bgzip/environment.yaml
#   prefix: /conda-envs/404dea7777718ab03637654fd0ed715f
#   channels:
#     - conda-forge
#     - bioconda
#     - nodefaults
#   dependencies:
#     - htslib =1.16
RUN mkdir -p /conda-envs/404dea7777718ab03637654fd0ed715f
ADD https://github.com/snakemake/snakemake-wrappers/raw/v1.21.1/bio/bgzip/environment.yaml /conda-envs/404dea7777718ab03637654fd0ed715f/environment.yaml

# Conda environment:
#   source: https://github.com/snakemake/snakemake-wrappers/raw/v1.21.1/bio/bwa/index/environment.yaml
#   prefix: /conda-envs/c2273db56372af81b557728cddb6ccd7
#   channels:
#     - conda-forge
#     - bioconda
#     - nodefaults
#   dependencies:
#     - bwa =0.7.17
RUN mkdir -p /conda-envs/c2273db56372af81b557728cddb6ccd7
ADD https://github.com/snakemake/snakemake-wrappers/raw/v1.21.1/bio/bwa/index/environment.yaml /conda-envs/c2273db56372af81b557728cddb6ccd7/environment.yaml

# Conda environment:
#   source: https://github.com/snakemake/snakemake-wrappers/raw/v1.21.1/bio/bwa/mem/environment.yaml
#   prefix: /conda-envs/505f409006b4fbf16040d98b325ed568
#   channels:
#     - conda-forge
#     - bioconda
#     - nodefaults
#   dependencies:
#     - bwa =0.7.17
#     - samtools =1.16.1
#     - picard-slim =2.27.4
#     - snakemake-wrapper-utils =0.5.0
RUN mkdir -p /conda-envs/505f409006b4fbf16040d98b325ed568
ADD https://github.com/snakemake/snakemake-wrappers/raw/v1.21.1/bio/bwa/mem/environment.yaml /conda-envs/505f409006b4fbf16040d98b325ed568/environment.yaml

# Conda environment:
#   source: https://github.com/snakemake/snakemake-wrappers/raw/v1.21.1/bio/fastp/environment.yaml
#   prefix: /conda-envs/ddb425372aa0223efac44583d244beb4
#   channels:
#     - conda-forge
#     - bioconda
#     - nodefaults
#   dependencies:
#     - fastp =0.23.2
RUN mkdir -p /conda-envs/ddb425372aa0223efac44583d244beb4
ADD https://github.com/snakemake/snakemake-wrappers/raw/v1.21.1/bio/fastp/environment.yaml /conda-envs/ddb425372aa0223efac44583d244beb4/environment.yaml

# Conda environment:
#   source: https://github.com/snakemake/snakemake-wrappers/raw/v1.21.1/bio/multiqc/environment.yaml
#   prefix: /conda-envs/eebc5adeb5e51053b4346bc959a40041
#   channels:
#     - conda-forge
#     - bioconda
#     - nodefaults
#   dependencies:
#     - multiqc =1.13
RUN mkdir -p /conda-envs/eebc5adeb5e51053b4346bc959a40041
ADD https://github.com/snakemake/snakemake-wrappers/raw/v1.21.1/bio/multiqc/environment.yaml /conda-envs/eebc5adeb5e51053b4346bc959a40041/environment.yaml

# Conda environment:
#   source: https://github.com/snakemake/snakemake-wrappers/raw/v1.21.1/bio/samtools/faidx/environment.yaml
#   prefix: /conda-envs/bb3906be70e50c58a2f9c73826e6c973
#   channels:
#     - conda-forge
#     - bioconda
#     - nodefaults
#   dependencies:
#     - samtools =1.16.1
#     - snakemake-wrapper-utils =0.5.0
RUN mkdir -p /conda-envs/bb3906be70e50c58a2f9c73826e6c973
ADD https://github.com/snakemake/snakemake-wrappers/raw/v1.21.1/bio/samtools/faidx/environment.yaml /conda-envs/bb3906be70e50c58a2f9c73826e6c973/environment.yaml

# Conda environment:
#   source: https://github.com/snakemake/snakemake-wrappers/raw/v1.21.1/bio/samtools/index/environment.yaml
#   prefix: /conda-envs/851a5df29edaf302e173deb7719ea8ba
#   channels:
#     - conda-forge
#     - bioconda
#     - nodefaults
#   dependencies:
#     - samtools =1.16.1
RUN mkdir -p /conda-envs/851a5df29edaf302e173deb7719ea8ba
ADD https://github.com/snakemake/snakemake-wrappers/raw/v1.21.1/bio/samtools/index/environment.yaml /conda-envs/851a5df29edaf302e173deb7719ea8ba/environment.yaml

# Conda environment:
#   source: https://github.com/snakemake/snakemake-wrappers/raw/v1.21.2/bio/fastqc/environment.yaml
#   prefix: /conda-envs/8678da093d0504bc9ac36dfd48d4c62e
#   channels:
#     - conda-forge
#     - bioconda
#     - nodefaults
#   dependencies:
#     - fastqc =0.11.9
RUN mkdir -p /conda-envs/8678da093d0504bc9ac36dfd48d4c62e
ADD https://github.com/snakemake/snakemake-wrappers/raw/v1.21.2/bio/fastqc/environment.yaml /conda-envs/8678da093d0504bc9ac36dfd48d4c62e/environment.yaml

# Conda environment:
#   source: https://github.com/snakemake/snakemake-wrappers/raw/v1.21.2/bio/gatk/haplotypecaller/environment.yaml
#   prefix: /conda-envs/01512485a311d920276eb9ba4ce15bde
#   channels:
#     - conda-forge
#     - bioconda
#     - nodefaults
#   dependencies:
#     - gatk4 =4.3.0.0
#     - snakemake-wrapper-utils =0.5.0
RUN mkdir -p /conda-envs/01512485a311d920276eb9ba4ce15bde
ADD https://github.com/snakemake/snakemake-wrappers/raw/v1.21.2/bio/gatk/haplotypecaller/environment.yaml /conda-envs/01512485a311d920276eb9ba4ce15bde/environment.yaml

# Conda environment:
#   source: https://github.com/snakemake/snakemake-wrappers/raw/v1.21.2/bio/gatk/varianteval/environment.yaml
#   prefix: /conda-envs/2279f0242203c5557ae399ee683c844f
#   channels:
#     - conda-forge
#     - bioconda
#     - nodefaults
#   dependencies:
#     - gatk4 =4.2
#     - snakemake-wrapper-utils =0.5
RUN mkdir -p /conda-envs/2279f0242203c5557ae399ee683c844f
ADD https://github.com/snakemake/snakemake-wrappers/raw/v1.21.2/bio/gatk/varianteval/environment.yaml /conda-envs/2279f0242203c5557ae399ee683c844f/environment.yaml

# Conda environment:
#   source: https://github.com/snakemake/snakemake-wrappers/raw/v1.21.2/bio/picard/addorreplacereadgroups/environment.yaml
#   prefix: /conda-envs/6c7206c0cf5b3c594d97c53133862226
#   channels:
#     - conda-forge
#     - bioconda
#     - nodefaults
#   dependencies:
#     - picard =2.27
#     - snakemake-wrapper-utils ==0.1.3
RUN mkdir -p /conda-envs/6c7206c0cf5b3c594d97c53133862226
ADD https://github.com/snakemake/snakemake-wrappers/raw/v1.21.2/bio/picard/addorreplacereadgroups/environment.yaml /conda-envs/6c7206c0cf5b3c594d97c53133862226/environment.yaml

# Conda environment:
#   source: https://github.com/snakemake/snakemake-wrappers/raw/v1.21.2/bio/picard/createsequencedictionary/environment.yaml
#   prefix: /conda-envs/e077831c8ad882567be2999d8ecdc349
#   channels:
#     - conda-forge
#     - bioconda
#     - nodefaults
#   dependencies:
#     - picard =2.27.4
#     - snakemake-wrapper-utils =0.5.0
RUN mkdir -p /conda-envs/e077831c8ad882567be2999d8ecdc349
ADD https://github.com/snakemake/snakemake-wrappers/raw/v1.21.2/bio/picard/createsequencedictionary/environment.yaml /conda-envs/e077831c8ad882567be2999d8ecdc349/environment.yaml

# Conda environment:
#   source: https://github.com/snakemake/snakemake-wrappers/raw/v1.21.4/bio/quast/environment.yaml
#   prefix: /conda-envs/a67d836cacf8b67941d1b23863f93480
#   channels:
#     - conda-forge
#     - bioconda
#     - nodefaults
#   dependencies:
#     - quast =5.2.0
RUN mkdir -p /conda-envs/a67d836cacf8b67941d1b23863f93480
ADD https://github.com/snakemake/snakemake-wrappers/raw/v1.21.4/bio/quast/environment.yaml /conda-envs/a67d836cacf8b67941d1b23863f93480/environment.yaml

# Conda environment:
#   source: https://github.com/snakemake/snakemake-wrappers/raw/v1.21.4/bio/spades/metaspades/environment.yaml
#   prefix: /conda-envs/1015220774abfca9c932b34e0250f9dc
#   channels:
#     - conda-forge
#     - bioconda
#     - nodefaults
#   dependencies:
#     - spades =3.15.5
#     - python =3.11.0
RUN mkdir -p /conda-envs/1015220774abfca9c932b34e0250f9dc
ADD https://github.com/snakemake/snakemake-wrappers/raw/v1.21.4/bio/spades/metaspades/environment.yaml /conda-envs/1015220774abfca9c932b34e0250f9dc/environment.yaml

# Conda environment:
#   source: workflow/envs/bcftools.yaml
#   prefix: /conda-envs/39385a59eefecf99a9ec73ed8d34e57a
#   channels:
#     - bioconda
#     - conda-forge
#   dependencies:
#     - bcftools =1.16
RUN mkdir -p /conda-envs/39385a59eefecf99a9ec73ed8d34e57a
COPY workflow/envs/bcftools.yaml /conda-envs/39385a59eefecf99a9ec73ed8d34e57a/environment.yaml

# Conda environment:
#   source: workflow/envs/pangolin.yaml
#   prefix: /conda-envs/b8e965cd1a99a7070a4c4dc76d3784fb
#   channels:
#     - bioconda
#     - conda-forge
#   dependencies:
#     - pangolin =4.1.3
RUN mkdir -p /conda-envs/b8e965cd1a99a7070a4c4dc76d3784fb
COPY workflow/envs/pangolin.yaml /conda-envs/b8e965cd1a99a7070a4c4dc76d3784fb/environment.yaml

# Conda environment:
#   source: workflow/envs/ragtag.yaml
#   prefix: /conda-envs/0ec57894805461d84ba539ebb69b4609
#   channels:
#     - bioconda
#     - conda-forge
#   dependencies:
#     - ragtag =2.1.0
#     - networkx =2.5.1
RUN mkdir -p /conda-envs/0ec57894805461d84ba539ebb69b4609
COPY workflow/envs/ragtag.yaml /conda-envs/0ec57894805461d84ba539ebb69b4609/environment.yaml

# Conda environment:
#   source: workflow/envs/seqtk.yaml
#   prefix: /conda-envs/1de235b0101e27bd0858b263e2895d9b
#   channels:
#     - bioconda
#     - conda-forge
#   dependencies:
#     - seqtk =1.3
RUN mkdir -p /conda-envs/1de235b0101e27bd0858b263e2895d9b
COPY workflow/envs/seqtk.yaml /conda-envs/1de235b0101e27bd0858b263e2895d9b/environment.yaml

# Conda environment:
#   source: workflow/envs/snpeff.yaml
#   prefix: /conda-envs/20363af4023ec341ed0d4303a1d12988
#   channels:
#     - bioconda
#     - conda-forge
#   dependencies:
#     - snpeff =5.1
#     - bcftools =1.16
RUN mkdir -p /conda-envs/20363af4023ec341ed0d4303a1d12988
COPY workflow/envs/snpeff.yaml /conda-envs/20363af4023ec341ed0d4303a1d12988/environment.yaml

# Step 2: Generate conda environments

RUN mamba env create --prefix /conda-envs/404dea7777718ab03637654fd0ed715f --file /conda-envs/404dea7777718ab03637654fd0ed715f/environment.yaml && \
    mamba env create --prefix /conda-envs/c2273db56372af81b557728cddb6ccd7 --file /conda-envs/c2273db56372af81b557728cddb6ccd7/environment.yaml && \
    mamba env create --prefix /conda-envs/505f409006b4fbf16040d98b325ed568 --file /conda-envs/505f409006b4fbf16040d98b325ed568/environment.yaml && \
    mamba env create --prefix /conda-envs/ddb425372aa0223efac44583d244beb4 --file /conda-envs/ddb425372aa0223efac44583d244beb4/environment.yaml && \
    mamba env create --prefix /conda-envs/eebc5adeb5e51053b4346bc959a40041 --file /conda-envs/eebc5adeb5e51053b4346bc959a40041/environment.yaml && \
    mamba env create --prefix /conda-envs/bb3906be70e50c58a2f9c73826e6c973 --file /conda-envs/bb3906be70e50c58a2f9c73826e6c973/environment.yaml && \
    mamba env create --prefix /conda-envs/851a5df29edaf302e173deb7719ea8ba --file /conda-envs/851a5df29edaf302e173deb7719ea8ba/environment.yaml && \
    mamba env create --prefix /conda-envs/8678da093d0504bc9ac36dfd48d4c62e --file /conda-envs/8678da093d0504bc9ac36dfd48d4c62e/environment.yaml && \
    mamba env create --prefix /conda-envs/01512485a311d920276eb9ba4ce15bde --file /conda-envs/01512485a311d920276eb9ba4ce15bde/environment.yaml && \
    mamba env create --prefix /conda-envs/2279f0242203c5557ae399ee683c844f --file /conda-envs/2279f0242203c5557ae399ee683c844f/environment.yaml && \
    mamba env create --prefix /conda-envs/6c7206c0cf5b3c594d97c53133862226 --file /conda-envs/6c7206c0cf5b3c594d97c53133862226/environment.yaml && \
    mamba env create --prefix /conda-envs/e077831c8ad882567be2999d8ecdc349 --file /conda-envs/e077831c8ad882567be2999d8ecdc349/environment.yaml && \
    mamba env create --prefix /conda-envs/a67d836cacf8b67941d1b23863f93480 --file /conda-envs/a67d836cacf8b67941d1b23863f93480/environment.yaml && \
    mamba env create --prefix /conda-envs/1015220774abfca9c932b34e0250f9dc --file /conda-envs/1015220774abfca9c932b34e0250f9dc/environment.yaml && \
    mamba env create --prefix /conda-envs/39385a59eefecf99a9ec73ed8d34e57a --file /conda-envs/39385a59eefecf99a9ec73ed8d34e57a/environment.yaml && \
    mamba env create --prefix /conda-envs/b8e965cd1a99a7070a4c4dc76d3784fb --file /conda-envs/b8e965cd1a99a7070a4c4dc76d3784fb/environment.yaml && \
    mamba env create --prefix /conda-envs/0ec57894805461d84ba539ebb69b4609 --file /conda-envs/0ec57894805461d84ba539ebb69b4609/environment.yaml && \
    mamba env create --prefix /conda-envs/1de235b0101e27bd0858b263e2895d9b --file /conda-envs/1de235b0101e27bd0858b263e2895d9b/environment.yaml && \
    mamba env create --prefix /conda-envs/20363af4023ec341ed0d4303a1d12988 --file /conda-envs/20363af4023ec341ed0d4303a1d12988/environment.yaml && \
    mamba clean --all -y

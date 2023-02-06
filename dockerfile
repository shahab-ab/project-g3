FROM condaforge/mambaforge:latest
WORKDIR /project
COPY . /project
RUN mamba create -c conda-forge -c bioconda -n snakemake snakemake -y
RUN chmod +x ./docker-install-deps.sh
RUN ./docker-install-deps.sh
SHELL ["mamba", "run", "-n", "snakemake", "/bin/bash", "-c"]
ENTRYPOINT ["mamba", "run", "--no-capture-output", "-n", "snakemake", "snakemake", "--use-conda", "--cores", "4", "report/qc/multiqc.html"]
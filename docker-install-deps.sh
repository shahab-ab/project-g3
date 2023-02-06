mkdir config
cp docker-sample/config.yaml config
mkdir data/samples
cp docker-sample/Demo1_SRX9937688_downsampled_R1_001.fastq.gz docker-sample/Demo1_SRX9937688_downsampled_R2_001.fastq.gz data/samples
mamba run --no-capture-output -n snakemake snakemake --use-conda --cores 4 report/qc/multiqc.html
rm -r config data/samples logs results report
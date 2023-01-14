# Sars-CoV-2 Lineage Identification Pipeline

Still a work in progress.

## Usage

Copy the samples which you would like to test.

The each sample must consist of a paired-end read.

Samples must be named as follows:

```
<SAMPLE_NAME>_R1_001.fastq.gz # First read
<SAMPLE_NAME>_R2_001.fastq.gz # Second read
```

Then edit `config.yaml` and change the sample names (only put the `<SAMPLE_NAME>` part as shown above).

With conda and snakemake installed, run the following:

```
snakemake --use-conda --cores 4
```

Then check the csv files in `results/lineage_reports`.

## References
https://www.ncbi.nlm.nih.gov/sra/docs/sars-cov-2-illumina-variant-calling-pipeline/
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9013232/
https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0262953
https://github.com/dridk/Sars-CoV-2-NGS-pipeline
https://github.com/charlesfoster/covid-illumina-snakemake

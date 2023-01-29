# Sars-CoV-2 Lineage Identification Pipeline

Still a work in progress.

## Usage

Copy the samples which you would like to test to `data/samples`.

Each sample must consist of a paired-end read. Samples must be named as follows:

```
<SAMPLE_NAME>_R1_001.fastq.gz # First read
<SAMPLE_NAME>_R2_001.fastq.gz # Second read
```

Then edit `config.yaml` and change the `samples` property to the names of the samples (only put the `<SAMPLE_NAME>` part as shown above).

With conda and snakemake installed, run the following:

```
snakemake --use-conda --cores 4 report/qc/multiqc.html
```

Then check the csv files in `report/qc/multiqc.html`.

## Pipeline Steps

- Extract samples (bgzip)
- Index genome (cp, bwa index, samtools faidx)
- Trim reads (fastp)
- Align reads (bwa mem)
- Sort alignments and index (samtools sort, samtools index)
- Add read groups and index (picard addorreplacereadgroupd, samtools index, picard createsequencedictionary)
- Call variants (gatk haplotypecaller)
- Filter variants (gatk variantfiltration)
- Annotate calls (snpEff)
- Index calls and consensus (tabix index, bcftools consensus)
- Assign lineage (pangolin)
- Create stats and final report (samtools stats, bcftools stats, fastqc, gatk varianteval, multiqc)

## Resources

- https://www.ncbi.nlm.nih.gov/sra/docs/sars-cov-2-illumina-variant-calling-pipeline/
- https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9013232/
- https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0262953
- https://github.com/dridk/Sars-CoV-2-NGS-pipeline
- https://github.com/charlesfoster/covid-illumina-snakemake

## TODO

- Review Quast
- Snakemake/Docker repository
- Show better final output
- Check for bottlenecks
- Follow https://snakemake.readthedocs.io/en/stable/snakefiles/deployment.html

## Improvements

- Add varlociraptor
- Support single-end reads

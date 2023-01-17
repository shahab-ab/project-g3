rule samtools_stats:
    input: bam="results/sorted/{sample}.bam"
    output: "report/samtools_stats/{sample}.txt"
    log: "logs/samtools_stats/{sample}.log"
    wrapper: "v1.21.2/bio/samtools/stats"

rule bcftools_stats:
    input: "results/annotated_calls/{sample}.vcf.gz"
    output: "report/bcftools_stats/{sample}.txt"
    conda: "../envs/bcftools.yaml"
    log: "logs/bcftools_stats/{sample}.log"
    shell: "bcftools stats {input} > {output} 2> {log}"

rule fastqc:
    input: "data/samples/{sample}.fastq.gz"
    output:
        html="report/fastqc/{sample}.html",
        zip="report/fastqc/{sample}_fastqc.zip"
    params: "--quiet"
    log: "logs/fastqc/{sample}.log"
    threads: 4
    wrapper: "v1.21.2/bio/fastqc"

rule gatk_varianteval:
    input:
        vcf="results/annotated_calls/{sample}.vcf.gz",
        vcf_idx="results/annotated_calls/{sample}.vcf.gz.tbi",
        ref="results/genome/genome.fa",
        dict="results/genome/genome.dict",
    output: vcf="report/varianteval/{sample}.grp",
    log: "logs/gatk/varianteval/{sample}.log",
    params:
        extra="",
        java_opts="",
    resources: mem_mb=1024,
    wrapper: "v1.21.2/bio/gatk/varianteval"


rule multiqc:
    input:
        expand("report/lineage/{sample}.csv", sample=config["samples"]) +
        expand("report/samtools_stats/{sample}.txt", sample=config["samples"]) +
        expand("report/bcftools_stats/{sample}.txt", sample=config["samples"]) +
        expand("report/trim_reads/{sample}_fastp.json", sample=config["samples"]) +
        expand("report/fastqc/{sample}_R1_001_fastqc.zip", sample=config["samples"]) +
        expand("report/fastqc/{sample}_R2_001_fastqc.zip", sample=config["samples"]) +
        expand("report/snpeff/{sample}.csv", sample=config["samples"]) +
        expand("report/varianteval/{sample}.grp", sample=config["samples"])
    output: "report/qc/multiqc.html"
    params:
        extra="",
        use_input_files_only=True
    log: "logs/multiqc.log"
    wrapper: "v1.21.1/bio/multiqc"

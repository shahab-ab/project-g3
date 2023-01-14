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
    input: "results/trimmed/{sample}.fastq"
    output:
        html="report/fastqc/{sample}.html",
        zip="report/fastqc/{sample}_fastqc.zip"
    params: "--quiet"
    log: "logs/fastqc/{sample}.log"
    threads: 4
    wrapper: "v1.21.2/bio/fastqc"

rule multiqc:
    input:
        expand("report/lineage/{sample}.csv", sample=config["samples"]) +
        expand("report/samtools_stats/{sample}.txt", sample=config["samples"]) +
        expand("report/bcftools_stats/{sample}.txt", sample=config["samples"]) +
        expand("report/trim_reads/{sample}_fastp.json", sample=config["samples"]) +
        expand("report/fastqc/{sample}.1_fastqc.zip", sample=config["samples"]) +
        expand("report/fastqc/{sample}.2_fastqc.zip", sample=config["samples"]) +
        expand("report/snpeff/{sample}.csv", sample=config["samples"])
    output: "report/qc/multiqc.html"
    params:
        extra="",
        use_input_files_only=True
    log: "logs/multiqc.log"
    wrapper: "v1.21.1/bio/multiqc"

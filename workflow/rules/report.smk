rule fastqc:
    input: "data/samples/{sample}.fastq.gz"
    output:
        html="report/fastqc/{sample}.html",
        zip="report/fastqc/{sample}_fastqc.zip"
    params: "--quiet"
    log: "logs/fastqc/{sample}.log"
    threads: 4
    wrapper: "v1.21.2/bio/fastqc"

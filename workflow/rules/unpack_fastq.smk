rule unpack_fastq:
    input: "data/samples/{sample}.fastq.gz",
    output: "results/samples/{sample}.fastq",
    params: extra="-d",
    threads: 4
    log: "logs/unpack/{sample}.log",
    wrapper: "v1.21.1/bio/bgzip"

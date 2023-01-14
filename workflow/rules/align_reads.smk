rule align_reads:
    input:
        reads=["results/trimmed/{sample}.1.fastq", "results/trimmed/{sample}.2.fastq"],
        idx=multiext("results/genome/genome.fa", ".amb", ".ann", ".bwt", ".pac", ".sa"),
    output: "results/mapped/{sample}.bam",
    log: "logs/align_reads/{sample}.log",
    params:
        extra="",
        sorting="none",
        sort_order="queryname",
        sort_extra="",
    threads: 8
    wrapper: "v1.21.1/bio/bwa/mem"

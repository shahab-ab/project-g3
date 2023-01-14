rule sort_alignments:
    input: "results/mapped/{sample}.bam"
    output: "results/sorted/{sample}.bam"
    log: "logs/sort_alignments/{sample}.log"
    threads: 8
    wrapper: "v1.21.1/bio/samtools/sort"

rule index_sorted_samples:
    input: "results/sorted/{sample}.bam",
    output: "results/sorted/{sample}.bam.bai",
    log: "logs/index_sorted_samples/{sample}.log",
    params: extra="",
    threads: 4
    wrapper: "v1.21.1/bio/samtools/index"

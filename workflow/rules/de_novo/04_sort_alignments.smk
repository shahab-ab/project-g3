rule sort_alignments_denovo:
    input: "results/denovo/mapped/{sample}.bam"
    output: "results/denovo/sorted/{sample}.bam"
    log: "logs/sort_alignments_denovo/{sample}.log"
    threads: 8
    wrapper: "v1.21.1/bio/samtools/sort"

rule index_sorted_samples_denovo:
    input: "results/denovo/sorted/{sample}.bam",
    output: "results/denovo/sorted/{sample}.bam.bai",
    log: "logs/index_sorted_samples_denovo/{sample}.log",
    params: extra="",
    threads: 4
    wrapper: "v1.21.1/bio/samtools/index"

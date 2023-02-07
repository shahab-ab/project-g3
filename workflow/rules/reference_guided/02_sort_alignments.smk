rule sort_alignments_refbased:
    input: "results/refbased/mapped/{sample}.bam"
    output: "results/refbased/sorted/{sample}.bam"
    log: "logs/sort_alignments_refbased/{sample}.log"
    threads: 8
    wrapper: "v1.21.1/bio/samtools/sort"

rule index_sorted_samples_refbased:
    input: "results/refbased/sorted/{sample}.bam",
    output: "results/refbased/sorted/{sample}.bam.bai",
    log: "logs/refbased/index_sorted_samples/{sample}.log",
    params: extra="",
    threads: 4
    wrapper: "v1.21.1/bio/samtools/index"

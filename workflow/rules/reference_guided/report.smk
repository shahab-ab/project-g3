rule samtools_stats_refbased:
    input: bam="results/refbased/sorted/{sample}.bam"
    output: "report/samtools_stats_refbased/{sample}.txt"
    log: "logs/samtools_stats_refbased/{sample}.log"
    wrapper: "v1.21.2/bio/samtools/stats"

rule bcftools_stats_refbased:
    input: "results/refbased/annotated_calls/{sample}.vcf.gz"
    output: "report/bcftools_stats_refbased/{sample}.txt"
    conda: "../../envs/bcftools.yaml"
    log: "logs/bcftools_stats_refbased/{sample}.log"
    shell: "bcftools stats {input} > {output} 2> {log}"

rule gatk_varianteval_refbased:
    input:
        vcf="results/refbased/annotated_calls/{sample}.vcf.gz",
        vcf_idx="results/refbased/annotated_calls/{sample}.vcf.gz.tbi",
        ref="results/genome/genome.fa",
        dict="results/genome/genome.dict",
    output: vcf="report/gatk_varianteval_refbased/{sample}.grp",
    log: "logs/gatk_varianteval_refbased/{sample}.log",
    params:
        extra="",
        java_opts="",
    resources: mem_mb=1024,
    wrapper: "v1.21.2/bio/gatk/varianteval"

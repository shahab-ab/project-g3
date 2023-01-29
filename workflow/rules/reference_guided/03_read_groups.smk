rule replace_rg_refbased:
    input: "results/refbased/sorted/{sample}.bam",
    output: "results/refbased/fixed-rg/{sample}.bam",
    log: "logs/replace_rg_refbased/{sample}.log",
    params: extra="--RGLB lib1 --RGPL illumina --RGPU {sample} --RGSM {sample}",
    resources: mem_mb=1024,
    wrapper: "v1.21.2/bio/picard/addorreplacereadgroups"

rule index_fixed_rg_refbased:
    input: "results/refbased/fixed-rg/{sample}.bam",
    output: "results/refbased/fixed-rg/{sample}.bam.bai",
    log: "logs/index_fixed_rg_refbased/{sample}.log",
    params: extra="",
    threads: 4
    wrapper: "v1.21.1/bio/samtools/index"

rule replace_rg:
    input: "results/sorted/{sample}.bam",
    output: "results/fixed-rg/{sample}.bam",
    log: "logs/picard/replace_rg/{sample}.log",
    params: extra="--RGLB lib1 --RGPL illumina --RGPU {sample} --RGSM {sample}",
    resources: mem_mb=1024,
    wrapper: "v1.21.2/bio/picard/addorreplacereadgroups"

rule index_fixed_rg:
    input: "results/fixed-rg/{sample}.bam",
    output: "results/fixed-rg/{sample}.bam.bai",
    log: "logs/index_fixed_rg/{sample}.log",
    params: extra="",
    threads: 4
    wrapper: "v1.21.1/bio/samtools/index"

rule create_dict:
    input: "results/genome/genome.fa",
    output: "results/genome/genome.dict",
    log: "logs/picard/create_dict.log",
    params: extra="",
    resources: mem_mb=1024,
    wrapper: "v1.21.2/bio/picard/createsequencedictionary"

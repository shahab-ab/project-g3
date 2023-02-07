rule call_variants_refbased:
    input:
        bam="results/refbased/fixed-rg/{sample}.bam",
        bam_idx="results/refbased/fixed-rg/{sample}.bam.bai",
        ref="results/genome/genome.fa",
        ref_idx="results/genome/genome.fa.fai",
        ref_dict="results/genome/genome.dict",
    output: vcf="results/refbased/calls/{sample}.vcf",
    log: "logs/call_variants_refbased/{sample}.log",
    params:
        extra="--minimum-mapping-quality 10 --ploidy 2 -ERC BP_RESOLUTION ",
        java_opts="",
    threads: 4
    resources: mem_mb=1024,
    wrapper: "v1.21.2/bio/gatk/haplotypecaller"

rule gatk_filter_refbased:
    input:
        vcf="results/refbased/calls/{sample}.vcf",
        ref="results/genome/genome.fa",
    output: vcf="results/refbased/filtered_calls/{sample}.vcf",
    log: "logs/gatk_filter_refbased/{sample}.log",
    params:
        filters={"lowQUAL100": "QUAL < 100", "genomeEnd": "POS > 29850", "highFS60": "FS >= 60.0", "lowQD2.0": "QD < 2.0", "lowReadPosRankSum4.0": "ReadPosRankSum < -4.0", "highSOR4.0": "SOR >= 4.0"},
        extra="",
        java_opts="",
    resources: mem_mb=1024,
    wrapper: "v1.21.2/bio/gatk/variantfiltration"

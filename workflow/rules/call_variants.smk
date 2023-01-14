# TODO replace with another tool?
# maybe GATK + varlociraptor
# multiple callers + varlociraptor
# rule call_variants:
    # input:
        # ref="results/genome/genome.fa",
        # idx="results/genome/genome.fa.fai",
        # samples="results/sorted/{sample}.bam",
        # indexes="results/sorted/{sample}.bam.bai",
    # output: "results/calls/{sample}.bcf",
    # log: "logs/call_variants/{sample}.log",
    # params:
        # extra="",
        # chunksize=100000,
    # threads: 4
    # wrapper: "v1.21.1/bio/freebayes"
rule call_variants:
    input:
        bam="results/sorted/{sample}.bam",
        ref="results/genome/genome.fa",
    output: vcf="results/calls/{sample}.vcf",
    log: "logs/gatk/haplotypecaller/{sample}.log",
    params:
        extra="", # --minimum-mapping-quality 10 --ploidy 2 -ERC BP_RESOLUTION 
        java_opts="",
    threads: 4
    resources: mem_mb=1024,
    wrapper: "v1.21.2/bio/gatk/haplotypecaller"

rule gatk_filter:
    input:
        vcf="results/calls/{sample}.vcf",
        ref="results/genome/genome.fa",
    output: vcf="results/calls_filtered/{sample}.vcf",
    log: "logs/gatk/filter/snvs.log",
    params:
        filters={"lowAD10": 'vc.getGenotype("{wildcards.acc}").getAD().1 < 10', "lowQUAL100": "QUAL < 100", "genomeEnd": "POS > 29850", "highFS60": "FS >= 60.0", "lowQD2.0": "QD < 2.0", "lowReadPosRankSum4.0": "ReadPosRankSum < -4.0", "highSOR4.0": "SOR >= 4.0"},
        extra="",
        java_opts="",
    resources: mem_mb=1024,
    wrapper: "v1.21.2/bio/gatk/variantfiltration"


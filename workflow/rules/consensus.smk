# TODO this creates a vcf file not a gz file
rule bcf_to_vcf_gz:
    input: "results/calls/{sample}.bcf"
    output: "results/calls/{sample}.vcf.gz"
    log: "logs/bcf_to_vcf_gz/{sample}.log"
    params: extra="",
    wrapper: "v1.21.1/bio/bcftools/view"

rule index_vcf_gz:
    input: "results/calls/{sample}.vcf.gz"
    output: "results/calls/{sample}.vcf.gz.tbi"
    log: "logs/index_vcf_gz/{sample}.log"
    params: "-p vcf",
    wrapper: "v1.21.1/bio/tabix/index"

rule consensus:
    input:
        calls="results/calls/{sample}.vcf.gz",
        idx="results/calls/{sample}.vcf.gz.tbi",
        genome="results/genome/genome.fa",
    output: report("results/consensus/{sample}.fa", caption="report/sample.rst", category="sample")
    conda: "../envs/bcftools.yaml"
    log: "logs/consensus/{sample}.log"
    shell: "bcftools consensus {input.calls} -f {input.genome} 2> {log} | sed -e 's/^>.*$/>{wildcards.sample}/' > {output}"

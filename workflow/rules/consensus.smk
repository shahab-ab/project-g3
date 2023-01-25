rule pack_vcf:
    input: "results/{sample}.vcf"
    output: "results/{sample}.vcf.gz"
    log: "logs/pack_vcf/{sample}.log"
    wrapper: "v1.21.1/bio/bgzip"

rule index_vcf_gz:
    input: "results/{sample}.vcf.gz"
    output: "results/{sample}.vcf.gz.tbi"
    log: "logs/index_vcf_gz/{sample}.log"
    params: "-p vcf",
    wrapper: "v1.21.1/bio/tabix/index"

rule consensus:
    input:
        calls="results/annotated_calls/{sample}.vcf.gz",
        idx="results/annotated_calls/{sample}.vcf.gz.tbi",
        genome="results/genome/genome.fa",
    output: "results/constructed/{sample}_refbased.fa"
    conda: "../envs/bcftools.yaml"
    log: "logs/consensus/{sample}.log"
    shell: "bcftools consensus {input.calls} -f {input.genome} 2> {log} | sed -e 's/^>.*$/>{wildcards.sample}_refbased/' > {output}"

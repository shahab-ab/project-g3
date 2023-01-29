rule pack_vcf_refbased:
    input: "results/refbased/{sample}.vcf"
    output: "results/refbased/{sample}.vcf.gz"
    log: "logs/pack_vcf_refbased/{sample}.log"
    wrapper: "v1.21.1/bio/bgzip"

rule index_vcf_gz_refbased:
    input: "results/refbased/{sample}.vcf.gz"
    output: "results/refbased/{sample}.vcf.gz.tbi"
    log: "logs/index_vcf_gz_refbased/{sample}.log"
    params: "-p vcf",
    wrapper: "v1.21.1/bio/tabix/index"

rule consensus_refbased:
    input:
        calls="results/refbased/annotated_calls/{sample}.vcf.gz",
        idx="results/refbased/annotated_calls/{sample}.vcf.gz.tbi",
        genome="results/genome/genome.fa",
    output: "results/constructed/{sample}_refbased.fa"
    conda: "../../envs/bcftools.yaml"
    log: "logs/consensus_refbased/{sample}.log"
    shell: "bcftools consensus {input.calls} -f {input.genome} 2> {log} | sed -e 's/^>.*$/>{wildcards.sample}_refbased/' > {output}"

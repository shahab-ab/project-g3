rule correct_denovo:
    input:
        contigs="results/denovo/assembly/{sample}_contigs.fa",
        reference="results/genome/genome.fa"
    output: "results/denovo/corrected/{sample}.fa"
    conda: "../../envs/ragtag.yaml"
    log: "logs/correct_denovo/{sample}.log"
    params: path="results/denovo/corrected/{sample}"
    shell: "ragtag.py correct {input.reference} {input.contigs} -w -o {params.path} 2> {log} && cp {params.path}/ragtag.correct.fasta {output}"

rule scaffold_denovo:
    input:
        query="results/denovo/corrected/{sample}.fa",
        reference="results/genome/genome.fa"
    output: "results/denovo/scaffolded/{sample}.fa"
    conda: "../../envs/ragtag.yaml"
    log: "logs/scaffold_denovo/{sample}.log"
    params: path="results/denovo/scaffolded/{sample}"
    shell: "ragtag.py scaffold {input.reference} {input.query} -w -o {params.path} 2> {log} && cp {params.path}/ragtag.scaffold.fasta {output}"

rule patch_denovo:
    input:
        target="results/denovo/scaffolded/{sample}.fa",
        reference="results/genome/genome.fa"
    output: "results/denovo/patched/{sample}.fa"
    conda: "../../envs/ragtag.yaml"
    log: "logs/patch_denovo/{sample}.log"
    params: path="results/denovo/patched/{sample}"
    shell: "ragtag.py patch {input.target} {input.reference} -u -w -o {params.path} 2> {log} && cp {params.path}/ragtag.patch.fasta {output}"

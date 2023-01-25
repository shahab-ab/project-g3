rule assemble:
    input: reads=["results/trimmed/{sample}.1.fastq", "results/trimmed/{sample}.2.fastq"],
    output:
        contigs="results/assembly/{sample}_contigs.fa",
        scaffolds="results/assembly/{sample}_scaffolds.fa",
        dir=directory("results/assembly/{sample}_intermediate_files"),
    log: "logs/spades/{sample}.log",
    threads: 4
    resources:
        mem_mem=250000,
        time=60 * 24,
    wrapper: "v1.21.4/bio/spades/metaspades"

# rule assemble:
    # input:
        # reads1="results/trimmed/{sample}.1.fastq",
        # reads2="results/trimmed/{sample}.2.fastq",
    # output: "results/assembly/{sample}_contigs.fa",
    # log: "logs/megahit/{sample}.log",
    # threads: 4
    # conda: "../envs/megahit.yaml"
    # params: path="results/assembly/{sample}"
    # shell: "megahit -1 {input.reads1} -2 {input.reads2} -o {params.path} 2> {log} && cp {params.path}/final.contigs.fa {output}"

rule correct:
    input:
        contigs="results/assembly/{sample}_contigs.fa",
        reference="results/genome/genome.fa"
    output: "results/corrected/{sample}.fa"
    conda: "../envs/ragtag.yaml"
    log: "logs/ragtag/correct/{sample}.log"
    params: path="results/corrected/{sample}"
    shell: "ragtag.py correct {input.reference} {input.contigs} -w -o {params.path} 2> {log} && cp {params.path}/ragtag.correct.fasta {output}"

rule scaffold:
    input:
        query="results/corrected/{sample}.fa",
        reference="results/genome/genome.fa"
    output: "results/scaffolded/{sample}.fa"
    conda: "../envs/ragtag.yaml"
    log: "logs/ragtag/scaffold/{sample}.log"
    params: path="results/scaffolded/{sample}"
    shell: "ragtag.py scaffold {input.reference} {input.query} -w -o {params.path} 2> {log} && cp {params.path}/ragtag.scaffold.fasta {output}"

rule patch:
    input:
        target="results/scaffolded/{sample}.fa",
        reference="results/genome/genome.fa"
    output: "results/patched/{sample}.fa"
    conda: "../envs/ragtag.yaml"
    log: "logs/ragtag/patch/{sample}.log"
    params: path="results/patched/{sample}"
    shell: "ragtag.py patch {input.target} {input.reference} -u -w -o {params.path} 2> {log} && cp {params.path}/ragtag.patch.fasta {output}"

rule pilon:
    input:
        assembly="results/patched/{sample}.fa",
        reads="results/sorted_denovo/{sample}.bam",
        reads_idx="results/sorted_denovo/{sample}.bam.bai",
    output: "results/pilon/{sample}.fa"
    conda: "../envs/pilon.yaml"
    log: "logs/pilon/{sample}.log"
    shell: "pilon --genome {input.assembly} --frags {input.reads} --output {output} > {log} ; mv {output}.fasta {output}"

rule trim_rename_sequence:
    input: "results/patched/{sample}.fa"
    output: "results/constructed/{sample}_denovo.fa"
    conda: "../envs/seqtk.yaml"
    log: "logs/seqtk/{sample}.log"
    shell: "seqtk seq -L 500 {input} | sed -e 's/^>.*$/>{wildcards.sample}_denovo/' > {output}"


rule assemble_denovo:
    input: reads=["results/trimmed/{sample}.1.fastq", "results/trimmed/{sample}.2.fastq"],
    output:
        contigs="results/denovo/assembly/{sample}_contigs.fa",
        scaffolds="results/denovo/assembly/{sample}_scaffolds.fa",
        dir=directory("results/denovo/assembly/{sample}_intermediate_files"),
    log: "logs/assemble_denovo/{sample}.log",
    threads: 4
    resources:
        mem_mem=250000,
        time=60 * 24,
    wrapper: "v1.21.4/bio/spades/metaspades"

# rule assemble_denovo:
    # input:
        # reads1="results/denovo/trimmed/{sample}.1.fastq",
        # reads2="results/denovo/trimmed/{sample}.2.fastq",
    # output: "results/denovo/assembly/{sample}_contigs.fa",
    # log: "logs/assemble_denovo/{sample}.log",
    # threads: 4
    # conda: "../../envs/megahit.yaml"
    # params: path="results/denovo/assembly/{sample}"
    # shell: "megahit -1 {input.reads1} -2 {input.reads2} -o {params.path} 2> {log} && cp {params.path}/final.contigs.fa {output}"

rule copy_genome:
    input: "data/genomes/genome.fa",
    output: "results/genome/genome.fa"
    log: "logs/copy_genome.log"
    shell: "cp {input} {output}"

rule index_genome_bwa:
    input: "results/{genome}.fa",
    output: idx=multiext("results/{genome}.fa", ".amb", ".ann", ".bwt", ".pac", ".sa"),
    log: "logs/index_genome/{genome}_bwa.log",
    params: algorithm="bwtsw",
    wrapper: "v1.21.1/bio/bwa/index"

rule index_genome_samtools:
    input: "results/{genome}.fa",
    output: "results/{genome}.fa.fai",
    log: "logs/index_genome/{genome}_samtools.log",
    params: extra="",
    wrapper: "v1.21.1/bio/samtools/faidx"

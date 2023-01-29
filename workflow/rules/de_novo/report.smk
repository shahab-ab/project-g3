rule quast_denovo:
    input:
        fasta="results/denovo/assembly/{sample}_contigs.fa",
        ref="results/genome/genome.fa",
    output:
        multiext("report/quast_denovo/{sample}/report.", "html", "tex", "txt", "pdf", "tsv"),
    log: "logs/quast_denovo/{sample}.log",
    params: # extra="--min-contig 5 --min-identity 95.0",
    wrapper: "v1.21.4/bio/quast"

rule pilon_denovo:
    input:
        assembly="results/denovo/patched/{sample}.fa",
        reads="results/denovo/sorted_denovo/{sample}.bam",
        reads_idx="results/denovo/sorted/{sample}.bam.bai",
    output: "results/denovo/pilon/{sample}.fa"
    conda: "../../envs/pilon.yaml"
    log: "logs/pilon_denovo/{sample}.log"
    shell: "pilon --genome {input.assembly} --frags {input.reads} --output {output} > {log} ; mv {output}.fasta {output}"

rule trim_rename_sequence_denovo:
    input: "results/denovo/patched/{sample}.fa"
    output: "results/constructed/{sample}_denovo.fa"
    conda: "../../envs/seqtk.yaml"
    log: "logs/trim_rename_sequence_denovo/{sample}.log"
    shell: "seqtk seq -L 500 {input} | sed -e 's/^>.*$/>[denovo] {wildcards.sample}/' > {output}"


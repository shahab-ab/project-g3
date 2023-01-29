rule assign_lineage:
    input: "results/constructed/{sample}.fa"
    output: "report/assign_lineage/{sample}.csv"
    conda: "../envs/pangolin.yaml"
    log: "logs/assign_lineage/{sample}.log"
    threads: 4
    shell: "pangolin {input} --outfile {output}"

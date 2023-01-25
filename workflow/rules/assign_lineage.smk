rule assign_lineage:
    input: "results/constructed/{sample}.fa"
    output: "report/lineage/{sample}.csv"
    conda: "../envs/pangolin.yaml"
    log: "logs/assign_lineage/{sample}.log"
    threads: 4
    shell: "pangolin {input} --outfile {output}"

rule assign_lineage:
    input: "results/consensus/{sample}.fa"
    output: "report/lineage/{sample}.csv"
    conda: "../envs/pangolin.yaml"
    log: "logs/assign_lineage/{sample}.log"
    shell: "pangolin {input} --outfile {output}"

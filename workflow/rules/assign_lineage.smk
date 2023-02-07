rule assign_lineage:
    input: "results/constructed/{sample}.fa"
    output: "report/assign_lineage/{sample}.csv"
    conda: "../envs/pangolin.yaml"
    log: "logs/assign_lineage/{sample}.log"
    threads: 4
    shell: "pangolin {input} --outfile {output} > {log}"

rule pick_lineage:
    input: [ "report/assign_lineage/{sample}_denovo.csv", "report/assign_lineage/{sample}_refbased.csv" ]
    output: "report/pick_lineage/{sample}.csv"
    log: "logs/pick_lineage/{sample}.log"
    script: "../scripts/pick_lineage.py"

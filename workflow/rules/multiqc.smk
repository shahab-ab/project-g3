rule multiqc:
    input:
        expand([
            "report/fastqc/{sample}.1_fastqc.zip",
            "report/fastqc/{sample}.2_fastqc.zip",
            "report/trim_reads/{sample}_fastp.json",
            "report/assign_lineage/{sample}_refbased.csv",
            "report/assign_lineage/{sample}_denovo.csv",
            "report/pick_lineage/{sample}.csv",
            "report/quast_denovo/{sample}/report.tsv",
            "report/samtools_stats_refbased/{sample}.txt",
            "report/bcftools_stats_refbased/{sample}.txt",
            "report/snpeff_annotate_refbased/{sample}.csv",
            "report/gatk_varianteval_refbased/{sample}.grp"
        ], sample=config["samples"].keys())
    output: "report/qc/multiqc.html"
    params:
        extra="",
        use_input_files_only=True
    log: "logs/multiqc.log"
    threads: 4
    wrapper: "v1.21.1/bio/multiqc"

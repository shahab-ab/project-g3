# TODO GATK compatible (-o gatk) 
rule snpeff_annotate:
    input:
        calls="results/calls/{sample}.vcf.gz",
        db="resources/snpeff/covid19_core"
    output:
        calls="results/annotated_calls/{sample}.vcf",
        stats="report/snpeff/{sample}.html",
        csvstats="report/snpeff/{sample}.csv"
    log: "logs/snpeff/{sample}.log"
    resources: mem_mb=4096
    wrapper: "v1.21.2/bio/snpeff/annotate"

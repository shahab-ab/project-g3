rule snpeff_annotate_refbased:
    input:
        calls="results/refbased/filtered_calls/{sample}.vcf"
    output:
        calls="results/refbased/annotated_calls/{sample}.vcf.gz",
        stats="report/snpeff_annotate_refbased/{sample}.html",
        csvstats="report/snpeff_annotate_refbased/{sample}.csv"
    log: "logs/snpeff_annotate_refbased/{sample}.log"
    resources: mem_mb=4096
    conda: "../../envs/snpeff.yaml"
    shell: "set -euo pipefail; snpEff -Xmx4096M -o gatk -stats {output.stats} -csvStats {output.csvstats} -v NC_045512.2 {input.calls} 2> {log} | bcftools view -Oz > {output.calls}"

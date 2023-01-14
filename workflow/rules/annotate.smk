rule snpeff_annotate:
    input:
        calls="results/calls/{sample}.vcf"
    output:
        calls="results/annotated_calls/{sample}.vcf.gz",
        stats="report/snpeff/{sample}.html",
        csvstats="report/snpeff/{sample}.csv"
    log: "logs/snpeff/{sample}.log"
    resources: mem_mb=4096
    conda: "../envs/snpeff.yaml"
    shell: "set -euo pipefail; snpEff  -Xmx4096M -stats {output.stats} -csvStats {output.csvstats} -v NC_045512.2 {input.calls} 2> {log} | bcftools view -Oz > {output.calls}"

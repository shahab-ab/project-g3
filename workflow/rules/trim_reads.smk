rule trim_reads:
    input:
        sample=["results/samples/{sample}_R1_001.fastq", "results/samples/{sample}_R2_001.fastq"]
    output:
        trimmed=["results/trimmed/{sample}.1.fastq", "results/trimmed/{sample}.2.fastq"],
        failed="results/trimmed/{sample}.failed.fastq",
        html="report/trim_reads/{sample}_fastp.html",
        json="report/trim_reads/{sample}_fastp.json"
    log: "logs/trim_reads/{sample}.log"
    params:
        adapters="--adapter_sequence GCGAATTTCGACGATCGTTGCATTAACTCGCGAA --adapter_sequence_r2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT",
        extra=""
    threads: 1
    wrapper: "v1.21.1/bio/fastp"

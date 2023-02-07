def select_input_sample_read(wildcards):
    suffix_key = 'r1_suffix'
    if wildcards.read_number == '2':
        suffix_key = 'r2_suffix'
    return expand("data/samples/{sample}{suffix}.fastq.gz",
                  sample=wildcards.sample,
                  suffix=config['samples'][wildcards.sample][suffix_key])

rule unpack_sample_second_read:
    input: select_input_sample_read,
    output: "results/samples/{sample}.{read_number,1|2}.fastq",
    params: extra="-d",
    threads: 4
    log: "logs/unpack/{sample}.{read_number}.log",
    wrapper: "v1.21.1/bio/bgzip"

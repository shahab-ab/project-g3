# Validate input and output
if len(snakemake.input) == 0:
    raise ValueError("Missing input file(s)")

if len(snakemake.output) == 0:
    raise ValueError("Missing output file")

if len(snakemake.output) > 1:
    raise ValueError("Too many output files")

# Parse CSV file into a 2-dimensional array
def read_lineage_report(filename):
    file_contents = ""
    with open(filename, "r") as f:
        file_contents = f.read()
    lines = file_contents.splitlines()
    return [line.split(",") for line in lines]

# Read all input files
reports = [read_lineage_report(input_file) for input_file in snakemake.input]

# Find best lineage
best_index = 0
for i in range(1, len(reports)):
    # Ignore if QC failed
    qc_pass = reports[i][1][13] == "pass"
    if not qc_pass:
        continue

    # Replace best if best's QC failed
    best_qc_pass = reports[best_index][1][13] == "pass"
    if not best_qc_pass:
        best_index = i
        continue

    # Ignore if conflict not present
    conflict_str = reports[i][1][2]
    if conflict_str == "":
        continue

    # Replace best if best's conflict not present
    best_conflict_str = reports[best_index][1][2]
    if best_conflict_str == "":
        best_index = i
        continue

    # If conflict is lower than best, replace best
    conflict = float(conflict_str)
    best_conflict = float(best_conflict_str)
    if conflict < best_conflict:
        best_index = i

# Rename sample
best_report = reports[best_index]
best_report[1][0] = snakemake.wildcards["sample"]

# Write to output
with open(snakemake.output[0], "w") as f:
    lines = [",".join(row) for row in best_report]
    f.write("\n".join(lines))

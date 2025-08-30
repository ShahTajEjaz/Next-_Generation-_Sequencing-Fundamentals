# -------- PROJECT 1: File Handling & Sequence Analysis --------

# 1) Print your name
$ echo "ShahTaj"

# 2) Create folder with your name
$ mkdir -p ShahTaj

# 3) Create biocomputing folder and move into it
$ mkdir -p biocomputing && cd biocomputing

# 4) Download files
$ wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna
$ wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
$ wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk

# 5) Move .fna file to your folder
$ mv wildtype.fna ../ShahTaj/

# 6) Remove duplicate .gbk file
$ rm -f wildtype.gbk.1

# 7) Check mutant/wild type and save mutant lines
$ FNA_FILE="../ShahTaj/wildtype.fna"
$ MUTANT_FILE="../ShahTaj/mutant_lines.txt"
$ TATA_COUNT=$(grep -io "tata" "$FNA_FILE" | wc -l)
$ TATATATA_COUNT=$(grep -io "tatatata" "$FNA_FILE" | wc -l)
$ echo "Number of 'tata' occurrences: $TATA_COUNT"
$ echo "Number of 'tatatata' occurrences: $TATATATA_COUNT"
$ if [ $TATATATA_COUNT -gt 0 ]; then
$     echo "Mutant detected (tatatata)"
$     grep -i "tatatata" "$FNA_FILE" > "$MUTANT_FILE"
$     echo "Mutant lines saved in $MUTANT_FILE"
$     RESULT_MSG="Mutant detected: $TATATATA_COUNT 'tatatata' occurrences"
$ else
$     echo "Wild type detected (only tata)"
$     RESULT_MSG="Wild type: $TATA_COUNT 'tata' occurrences"
$ fi

# 8) GBK Analysis
$ LINE_COUNT=$(grep -v "^>" wildtype.gbk | wc -l)
$ LOCUS_LINE=$(grep "^LOCUS" wildtype.gbk)
$ SOURCE_LINE=$(grep "^SOURCE" wildtype.gbk)
$ GENES=$(grep "/gene=" wildtype.gbk)
$ echo "Number of sequence lines (excluding headers): $LINE_COUNT"
$ echo "LOCUS line: $LOCUS_LINE"
$ echo "SOURCE line: $SOURCE_LINE"
$ echo "Gene names:"
$ echo "$GENES"

# 9) Clear terminal space
$ history
$ clear

# 10) List files in folders
$ echo "Files in ShahTaj folder:"
$ ls ../ShahTaj
$ echo "Files in biocomputing folder:"
$ ls

# -------- PROJECT 2: Conda Installation --------
$ conda activate
$ conda create -n funtools python=3.11 -y
$ conda activate funtools
$ conda install -c conda-forge figlet -y
$ figlet ShahTaj
$ conda install -c bioconda bwa blast samtools bedtools spades bcftools fastp multiqc -y

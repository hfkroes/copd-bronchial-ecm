#!/usr/bin/env nextflow

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Main nextflow workflow for splicing variant analysis
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    This is a DSL 2 Nextflow workflow to reproduce of all bioinformatics analysis in
    the paper "Bronchial extracellular matrix from COPD patients induces altered gene
    expression in repopulated primary human bronchial epithelial cells" published by
    Hedström, U., Hallgren, O., Öberg, L. et al. in 2018 in Scientific Reports under 
    the DOI code 10.1038/s41598-018-21727-w.
----------------------------------------------------------------------------------------
*/

// Including processes from subworkflows

include { downloadSRAdata } from './subworkflows/downloader'
include { downloadIndex } from './subworkflows/downloader'
include { runHISAT2 } from './subworkflows/hisat2'

// Defining input parameters

rna_seq_manifest = file('./data/SRA/SRA_manifest.txt')

workflow {

    // Defining main workflow

    //rna_seq_accessions = rna_seq_manifest.readLines()

    //downloadSRAdata(rna_seq_accessions)

    fastq_data = Channel
        .fromPath('./data/SRA/*.fastq')

    //downloadIndex()

    genome_index = Channel
        .fromPath('./data/Index/hg38/*')

    hisat2_input = fastq_data.combine(genome_index.collect())

    runHISAT2(hisat2_input)

}
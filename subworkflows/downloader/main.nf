#!/usr/bin/env nextflow

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Downloader subworkflow
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Downloads required files in specialized docker 
    container and saves them to the data folder
----------------------------------------------------------------------------------------
*/

process downloadSRAdata {

  // Downloads SRA runs as fastq files
  
  tag "${accession}"
  publishDir './data/SRA/', mode: 'copy'
  label 'inParallel'

  input:
    each accession

  output:
    path "*.fastq"

  script:
    """
    fastq-dump ${accession} --split-3 --split-spot --skip-technical
    """
}

process downloadIndex {

  //Downloads genome index files

  publishDir './data/Index/', mode: 'copy'

  output:
    path "*.ht2"

  script:
    """
    wget https://genome-idx.s3.amazonaws.com/hisat/hg38_genome.tar.gz
    chmod a+x make_hg38.sh
    ./make_hg38.sh
    """

}
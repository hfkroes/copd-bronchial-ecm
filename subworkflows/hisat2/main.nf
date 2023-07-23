#!/usr/bin/env nextflow

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    HISAT2 subworkflow
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Alligns fastqs to index genome using HISAT2 and
    converts the output into .bam files using SAMtools
----------------------------------------------------------------------------------------
*/

process runHISAT2 {

  // Alligns and converts files
  
  tag "${fastq.baseName}"
  publishDir './data/SAM/', mode: 'copy'
  stageInMode 'copy'
  label 'inSeries'

  input:
    tuple path(fastq), path(index1), path(index2), path(index3), path(index4), path(index5), path(index6), path(index7), path(index8)

  output:
    path "*.bam"
    path "*.log"

  script:
    """
    mkdir index
    mv *.ht2 index/
    hisat2 -p ${params.t} --dta -x index/genome -U ${fastq} ${fastq.baseName}.sam &> ${fastq.baseName}.log
    samtools view -bS ${fastq.baseName}.sam > ${fastq.baseName}.bam
    """

}


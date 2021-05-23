#!/bin/sh


inputFile=gencode.vM27.annotation.gff3
echo "========================================================"
echo "Finding all statistics for " $inputFile
echo "========================================================"

###############################################################
################  Find all genes AND TRX #################
################################################################

# awk '{if($3=="gene"  )  {print $0}}' $inputFile >  all_genes_mouse.gff3
echo "Total number of genes"
awk '{if($3=="gene"  )  {print $0}}' $inputFile | wc -l

# awk '{if($3=="transcript"  )  {print $0}}' $inputFile >  all_trx_mouse.gff3
echo "Total number of transcripts"
awk '{if($3=="transcript"  )  {print $0}}' $inputFile | wc -l

###############################################################
################  Protein-coding genes AND TRX #################
################################################################

echo "Find all protein-coding genes"
#awk '{if($3=="gene" && $9~"gene_type=protein_coding" )  {print $0}}' $inputFile >  pc_genes_mouse.gff3
awk '{if($3=="gene" && $9~"gene_type=protein_coding" )  {print $0}}' $inputFile |  wc -l


echo "Find Protein coding trx ;"
#awk '{if($3=="transcript" && $9~"transcript_type=protein_coding"  )  {print $0}}' $inputFile >  pc_transcript_mouse.gff3
awk '{if($3=="transcript" && $9~"transcript_type=protein_coding"  )  {print $0}}' $inputFile | wc -l


################################################################
########################  lncRNA genes and TRX #################
################################################################

echo "Find all lncRNA genes"
#awk '{if($3=="gene" && $9~"gene_type=(lncRNA|lincRNA|TEC|processed_transcript|antisense|sense_intronic|sense_overlapping)" ){print $0}}' $inputFile >  lncRNA_genes_mouse.gff3

awk '{if($3=="gene" && $9~"gene_type=(lncRNA|lincRNA|TEC|processed_transcript|antisense|sense_intronic|sense_overlapping)" ){print $0}}' $inputFile | wc -l 



################################################################
########################  small non-coding RNA genes and TRX #################
################################################################


echo "Find all small non-coding RNA"
#awk '{if($3=="gene" && $9~"gene_type=(miRNA|misc_RNA|Mt_rRNA|Mt_tRNA|ribozyme|rRNA|scaRNA|scRNA|snoRNA|snRNA|sRNA)" ) {print $0}}' $inputFile >  shortncRNA_genes_mouse.gff3

awk '{if($3=="gene" && $9~"gene_type=(miRNA|misc_RNA|Mt_rRNA|Mt_tRNA|ribozyme|rRNA|scaRNA|scRNA|snoRNA|snRNA|sRNA)" ) {print $0}}' $inputFile | wc -l


################################################################
########################  pseudo  genes and TRX #################
################################################################

echo "Find all pseudogenes"
#awk '{if($3=="gene" && $9~("pseudogene" ) ){print $0}}' $inputFile >  pseudogene_genes_mouse.gff3

awk '{if($3=="gene" && $9~("pseudogene" ) ){print $0}}' $inputFile | wc -l









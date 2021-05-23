#!/bin/sh


inputFile=gencode.v38.annotation.gff3
echo "========================================================"
echo "Finding all statistics for " $inputFile
echo "========================================================"

###############################################################
################  Find all genes AND TRX #################
################################################################

echo "Total number of human genes"
#awk '{if($3=="gene"  )  {print $0}}' $inputFile >  all_genes.gff3
awk '{if($3=="gene"  )  {print $0}}' $inputFile | wc -l

echo "Total number of human transcripts"
#awk '{if($3=="transcript"  )  {print $0}}' $inputFile >  all_trx.gff3
awk '{if($3=="transcript"  )  {print $0}}' $inputFile | wc -l


###############################################################
################  Protein-coding genes AND TRX #################
################################################################

echo "Find all protein-coding genes"
#awk '{if($3=="gene" && $9~"protein_coding" )  {print $0}}' $inputFile >  pc_genes.gff3
awk '{if($3=="gene" && $9~"protein_coding" )  {print $0}}' $inputFile | wc -l

#echo "Find Protein coding trx ;"
#awk '{if($3=="transcript" && $9~"transcript_type=protein_coding"  )  {print $0}}' $inputFile >  pc_transcript.gff3
#awk '{if($3=="transcript" && $9~"transcript_type=protein_coding"  )  {print $0}}' $inputFile | wc -l

#echo "Find protein-coding genes: with Level 1 or 2"
#awk '{if($3=="gene" && $9~"protein_coding" && $9~"level=(1|2)" )  {print $0}}' $inputFile >  pc_genes_L12.gff3

#echo "Find Protein coding trx ; Level 1 or 2"
#awk '{if($3=="transcript" && $9~"transcript_type=protein_coding" && $9~"level=(1|2)" ) {print $0}}' $inputFile >  pc_transcript_L12.gff3

#echo "Find Protein coding trx ; Level 1 or 2; most representative transcript of the gene. This will be the MANE_Select transcript if there is one, or a transcript chosen by an Ensembl algorithm otherwise. "
#echo  " MANE_Select : the transcript belongs to the MANE Select data set. The Matched Annotation from NCBI and EMBL-EBI project (MANE) is a collaboration between Ensembl-GENCODE and RefSeq to select a default transcript per human protein coding locus that is representative of biology, well-supported, expressed and conserved. This transcript set matches GRCh38 and is 100% identical between RefSeq and Ensembl-GENCODE for 5' UTR, CDS, splicing and 3' UTR. "
#awk '{if($3=="transcript" && $9~"transcript_type=protein_coding"  &&  $9~"Ensembl_canonical" ) {print $0}}' gencode.v38.annotation.gff3 >  pc_transcript_canonical.gff3


################################################################
########################  lncRNA genes and TRX #################
################################################################

echo "Find all lncRNA genes"
# awk '{if($3=="gene" && $9~"gene_type=lncRNA|TEC" ){print $0}}' $inputFile >  lncRNA_genes.gff3
awk '{if($3=="gene" && $9~"gene_type=TEC|lncRNA" ){print $0}}' $inputFile | wc -l

#echo "Find all lncRNA trx"
# awk '{if($3=="transcript" && $9~"transcript_type=lncRNA"  )  {print $0}}' $inputFile >  lncRNA_transcript.gff3




################################################################
########################  Small non-coding RNA genes and TRX ####
################################################################
echo "Find all Small non-coding RNA genes"
# awk '{if($3=="gene" && $9~"gene_type=(miRNA|misc_RNA|Mt_rRNA|Mt_tRNA|ribozyme|rRNA|scaRNA|scRNA|snoRNA|snRNA|sRNA)" ){print $0}}' $inputFile >  snRNA_genes.gff3
awk '{if($3=="gene" && $9~"gene_type=(miRNA|misc_RNA|Mt_rRNA|Mt_tRNA|ribozyme|rRNA|rRNA_pseudogene|scaRNA|scRNA|snoRNA|snRNA|sRNA|vault_RNA)" ){print $0}}' $inputFile  | wc -l


#echo "Find all snRNA trx"
# awk '{if($3=="transcript" && $9~"transcript_type=(miRNA|misc_RNA|Mt_rRNA|Mt_tRNA|ribozyme|rRNA|scaRNA|scRNA|snoRNA|snRNA|sRNA)"  )  {print $0}}' $inputFile >  snRNA_transcript.gff3



################################################################
########################  pseudo  genes and TRX #################
################################################################
echo "Find all pseudo genes"
# awk '{if($3=="gene" && $9~"pseudo" ){print $0}}' $inputFile >  pseudo_genes.gff3
#awk '{if($3=="gene" && $9~"gene_type=(pseudogene|processed_pseudogene|transcribed_processed_pseudogene|translated_processed_pseudogene|IG_C_pseudogene|IG_D_pseudogene|IG_pseudogene|TR_J_pseudogene|R_V_pseudogene|unitary_pseudogene|transcribed_unprocessed_pseudogene|translated_unprocessed_pseudogene|unprocessed_pseudogene|polymorphic_pseudogene)" ){print $0}}' $inputFile | wc -l
awk '{if($3=="gene" && $9~"gene_type=(pseudogene|processed_pseudogene|transcribed_processed_pseudogene|translated_processed_pseudogene|transcribed_unprocessed_pseudogene|translated_unprocessed_pseudogene|unprocessed_pseudogene|unitary_pseudogene|transcribed_unitary_pseudogene|polymorphic_pseudogene|transcribed_unprocessed_pseudogene|unprocessed_pseudogene|IG_C_pseudogene|IG_J_pseudogene|IG_V_pseudogene|TR_J_pseudogene|TR_V_pseudogene)" ){print $0}}' $inputFile | wc -l


#awk '{if($3=="gene" && $9~"gene_type=(pseudogene|)" ){print $0}}' $inputFile | wc -l
#echo "Find all pseudo trx"
# awk '{if($3=="transcript" && $9~"transcript_type=pseudo"  )  {print $0}}' $inputFile >  lncRNA_transcript.gff3




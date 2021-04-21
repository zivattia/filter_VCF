#filter VCF after keeping only biallelic sites and single copy sites
##file should not have .vcf.gz in the end

file=nectar_GATK_biallelic_singleCopy
maxM=0.9
maf=0.1
minQ=100

#output VCF with differnt filterinf values
#filter_list.txt should be tab delimeted
#cat filter_list.txt | while maxM maf minQ line; do
vcftools --gzvcf ${file}.vcf.gz --max-missing ${maxM} --maf ${maf} --minQ ${minQ} --out ${file}_filterd_minQ${minQ}_maxM${maxM}_maf${maf} --recode --recode-INFO-all


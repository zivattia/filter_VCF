#run this step after keeping only bialleleic sites (remove_biallelic_sites.sh)
#you will need the file - filterSingleCopy_working.py - in the working directory.
##keep vcf name without .vcf in the end
VCF=nectar_GATK_biallelic
path=/data5/nectar/usftp21.novogene.com/raw_data/GATK_nectar/
SCS=/home/pogoda/SingleCopySiteList 

python filterSingleCopy_working.py -s ${SCS} -v ${path}${VCF}.vcf > ${path}${VCF}_singleCopy.vcf

gzip ${path}${VCF}.vcf
gzip ${path}${VCF}_singleCopy.vcf



#vcftools --vcf Combined_Seed_Weevil.singleCopy.vcf --max-missing .5 --minQ 100 --MAF 0.1 --out Combined_Seed_Weevil.singleCopy.filtered.vcf --recode


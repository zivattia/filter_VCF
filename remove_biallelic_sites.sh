#keep only biallelic site in VCF
##remeber to delete .vcf from the file name##
file=nectar_GATK
path=/data5/nectar/usftp21.novogene.com/raw_data/GATK_nectar

grep "#" ${path}/${file}.vcf > ${path}/Header
grep -v "#" ${path}/${file}.vcf | awk '$5 !~ ","' > ${path}/tmp; cat ${path}/Header ${path}/tmp > ${path}/${file}_biallelic.vcf

rm ${path}/Header
rm ${path}/temp

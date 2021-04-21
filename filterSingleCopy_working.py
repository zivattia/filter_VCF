#################
## DEPENDENCIES ##
##################

import sys, argparse


#################################
## GET ARGUMENTS FROM TERMINAL ##
#################################


#initialize parsing
parser = argparse.ArgumentParser()

#add new arguments one line at a time in the following format: "flag", type=<int,?> (optional), "long", "help"
parser.add_argument("-s", "--singleCopy", help="a file containing first three of the vcf table for single copy sites")
parser.add_argument("-v", "--vcf", help="vcf table to be filtered for single copy sites")

#parse the arguments, store as object with methods
args = parser.parse_args()


#########################
## CREATE DICTIONARIES ##
#########################

#construct dictionary of the sites in the vcf file
vcfDict = {}
with open(args.vcf) as f:
    for line in f:
	if(line[0] != "#"):
		#get first two columns of vcf table as key, store whole line as value
		siteInfo = "\t".join(line.split()[0:2])
        	vcfDict[siteInfo] = line
	#	print siteInfo
	else:
		print line.strip()
f.close()


#######################################
## SEARCH SINGLE COPY TABLE FOR KEYS ##
#######################################

with open(args.singleCopy) as fs:
	for line_s in fs:
		cLine = "\t".join(line_s.split()[0:2])
		if cLine in vcfDict:
                        print vcfDict[cLine].strip()

fs.close() 

# vcf-validator-tool-set
A tool set for validating vcf file

## Quick Start
```
# vcf-validator
cd docker/vcf-validator
docker build -t ${IMAGE} .
bash run_vcf-validator.sh ${IMAGE} ${Input VCF} ${Output Directory} 

# vcflib/vcfcheck
cd docker/vcfcheck
docker build -t ${IMAGE} .
bash run_vcfcheck.sh ${IMAGE} ${Input VCF} ${Output Directory} ${Reference Genome}

# gatk ValidateVariants  
cd docker/gatk
docker build -t ${IMAGE} .
bash run_gatk.sh ${IMAGE} ${Input VCF} ${Output Directory} ${Reference Genome}
```

## Test Input
```
# contain the REF Error
test/5929.fisher_comp_result.ref_error.vcf.gz 
# contain the format Error
test/5929.fisher_comp_result.format_error.vcf.gz 
# NOT contain errors
test/5929.fisher_comp_result.vcf.gz 
```




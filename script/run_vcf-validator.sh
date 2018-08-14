#!/bin/sh

set -xv

IMAGE_NAME=$1
INPUT_VCF=$2
OUTPUT=$3

CMDNAME=`basename $0`
if [ $# -ne 3 ]; then
  echo "Usage:  $CMDNAME {input_vcf} {output_dir} {reference_genome}" 1>&2
  exit 1
fi

if [ ! -e $INPUT_VCF ]; then
  echo "${INPUT_VCF} NOT found."
fi

mkdir -p $OUTPUT

INPUT_DIR=$(cd $(dirname $INPUT_VCF) && pwd)
OUTPUT_DIR=$(cd $OUTPUT && pwd)

INPUT_BASE=`basename $INPUT_VCF`

DATE=`date '+%Y%m%d%H%M%S'`

docker run --rm -it \
  -v ${INPUT_DIR}:/local/input \
  -v ${OUTPUT_DIR}:/local/output \
  -w /local \
  ${IMAGE_NAME} vcf_validator_linux -i /local/input/$INPUT_BASE -o /local/output \
  1> ${OUTPUT}/${INPUT_BASE}.vcfvalidator.stdout.${DATE}.txt \
  2> ${OUTPUT}/${INPUT_BASE}.vcfvalidator.stderr.${DATE}.txt


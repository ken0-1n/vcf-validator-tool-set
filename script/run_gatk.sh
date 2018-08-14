#!/bin/sh

set -xv

IMAGE_NAME=$1
INPUT_VCF=$2
OUTPUT=$3
REFERENCE_GENOME=$4

CMDNAME=`basename $0`
if [ $# -ne 4 ]; then
  echo "Usage:  $CMDNAME {input_vcf} {output_dir} {reference_genome}" 1>&2
  exit 1
fi

if [ ! -e $INPUT_VCF ]; then
  echo "${INPUT_VCF} NOT found."
  exit 1
fi

if [ ! -e $REFERENCE_GENOME ]; then
  echo "${REFERENCE_GENOME} NOT found."
  exit 1
fi

mkdir -p $OUTPUT

INPUT_DIR=$(cd $(dirname $INPUT_VCF) && pwd)
REFERENCE_DIR=$(cd $(dirname $REFERENCE_GENOME) && pwd)

INPUT_BASE=`basename $INPUT_VCF`
REFERENCE_BASE=`basename $REFERENCE_GENOME`

DATE=`date '+%Y%m%d%H%M%S'`

docker run --rm -it \
  -v ${INPUT_DIR}:/local/input \
  -v ${REFERENCE_DIR}:/local/reference \
  -w /local \
  ${IMAGE_NAME} gatk ValidateVariants -R /local/reference/$REFERENCE_BASE -V /local/input/$INPUT_BASE --validation-type-to-exclude ALLELES \
  1> ${OUTPUT}/${INPUT_BASE}.gatk.stdout.${DATE}.txt \
  2> ${OUTPUT}/${INPUT_BASE}.gatk.stderr.${DATE}.txt


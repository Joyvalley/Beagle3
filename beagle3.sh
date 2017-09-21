#!/bin/bash


### Beagle 3 requires a specifc data format conversion from vcf as follows
### test.vcf is the input vcf. my_beagle is the prefix of the ouput files 

cat test.vcf  | java -jar tools/vcf2beagle.jar NA foo

## unzip the file

gzip -d foo.bgl.gz

##impute missing data again for larger data the memory has to be increased to more than 8GB

java -Xmx8G -jar tool/beagle.jar unphased=foo.bgl  missing=NA markers=foo.markers  out=foobar 

gzip -d foo.unphased*


cat foobar.foo.bgl.gprobs | java -jar tools/gprobs2beagle.jar 0.001 NA > b3.vcf

## the result is  a beagle3 imputed vcf file called b3.vcf






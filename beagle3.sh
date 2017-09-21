#!/bin/bash



### This little script can be executed with sh beagle3.sh
### I included some sample data so that you can try it before you enter the real data
### Large vcf files have to be seperated by chromosomes


### Beagle 3 requires a specifc data format for execution the conversion from vcf to bgl works  as follows:

### test.vcf is the input vcf file  my_beagle is the prefix of the ouput files 

cat test.vcf  | java -jar tools/vcf2beagle.jar NA foo

## unzip the file

gzip -d foo.bgl.gz

##impute missing data again for larger data the memory has to be increased to more than 8GB

java -Xmx8G -jar tools/beagle.jar unphased=foo.bgl  missing=NA markers=foo.markers  out=foobar 

gzip -d *.gz

cat foobar.foo.bgl.gprobs | java -jar tools/gprobs2beagle.jar 0.001 NA > b3.vcf

## the result is  a beagle3 imputed vcf file called b3.vcf






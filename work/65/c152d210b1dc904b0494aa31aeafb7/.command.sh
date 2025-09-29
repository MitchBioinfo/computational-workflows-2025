#!/bin/bash -euo pipefail
# Not calling gunzip itself because it creates files
# with the original group ownership rather than the
# default one for that user / the work directory
gzip \
    -cd \
     \
    Mus_musculus.GRCm38.81.gtf.gz \
    > Mus_musculus.GRCm38.81.gtf

cat <<-END_VERSIONS > versions.yml
"NFCORE_DIFFERENTIALABUNDANCE:DIFFERENTIALABUNDANCE:GUNZIP_GTF":
    gunzip: $(echo $(gunzip --version 2>&1) | sed 's/^.*(gzip) //; s/ Copyright.*$//')
END_VERSIONS

FROM mono

ARG version="2.0.2"

RUN apt-get update && \
    apt-get install -y wget unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://www.naturaldocs.org/download/natural_docs/${version}/Natural_Docs_${version}.zip && \
    unzip Natural_Docs_${version}.zip && \
    rm Natural_Docs_${version}.zip && \
    echo '#!/bin/bash \n mono "/Natural Docs/NaturalDocs.exe" $@' > /usr/bin/naturaldocs && \
    chmod +x /usr/bin/naturaldocs

WORKDIR /workdir

VOLUME ["/workdir"]

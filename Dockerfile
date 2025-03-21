FROM eclipse-temurin:17-alpine

ARG VOCBENCH_VERSION=14.0.0
ARG SEMANTIC_TURKEY_VERSION=14.0
ARG st_path=""

ADD https://bitbucket.org/art-uniroma2/vocbench3/downloads/vocbench3-${VOCBENCH_VERSION}-full.zip /tmp/

RUN set -eux ; \
	mkdir /opt/vocbench3 ; \
	mkdir /opt/vocbench3/data ; \
	cd /opt/vocbench3 ; \
	unzip -q /tmp/vocbench3-${VOCBENCH_VERSION}-full.zip -d . ; \
	if [ -n "$st_path" ]; then \
        mkdir -p /tmp/zipdiff/public/vocbench3/ && \
        unzip -p "semanticturkey-${SEMANTIC_TURKEY_VERSION}/lib/vocbench3-${VOCBENCH_VERSION}.jar" "public/vocbench3/vbconfig.js" > /tmp/zipdiff/public/vocbench3/vbconfig.js && \
        sed -i "s#^var st_path;#var st_path=\"${st_path}\"#" /tmp/zipdiff/public/vocbench3/vbconfig.js && \
        jar -uf "semanticturkey-${SEMANTIC_TURKEY_VERSION}/lib/vocbench3-${VOCBENCH_VERSION}.jar" -C "/tmp/zipdiff" "public/vocbench3/vbconfig.js" && \
        rm -r /tmp/zipdiff ; \
	fi; \
	chmod -R u=rwX,go=rX semanticturkey-${SEMANTIC_TURKEY_VERSION} ; \
	chmod +x semanticturkey-${SEMANTIC_TURKEY_VERSION}/bin/* ; \
	echo 'semanticturkey.data.dir=../data/SemanticTurkeyData' > semanticturkey-${SEMANTIC_TURKEY_VERSION}/application.properties ; \
	rm /tmp/vocbench3-${VOCBENCH_VERSION}-full.zip

WORKDIR /opt/vocbench3/semanticturkey-$SEMANTIC_TURKEY_VERSION

EXPOSE 1979
ENTRYPOINT ["bin/semanticturkey.sh"]

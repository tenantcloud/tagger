FROM tenantcloud/docker-pipeline

LABEL Maintainer="Oleh Debretseni https://github.com/odebretseni"

COPY tagger.sh /tagger.sh

ENTRYPOINT ["/tagger.sh"]

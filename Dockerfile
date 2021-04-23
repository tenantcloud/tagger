FROM tenantcloud/docker-pipeline

LABEL Maintainer="Oleh Debretseni https://github.com/odebretseni"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

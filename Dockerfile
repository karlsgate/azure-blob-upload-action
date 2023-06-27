FROM mcr.microsoft.com/azure-cli

LABEL com.github.actions.name="azure-blob-upload" \
      com.github.actions.description="Uploads local files to Azure Blob Storage containers" \
      com.github.actions.icon="box" \
      com.github.actions.color="blue" \
      repository="https://github.com/karlsgate/azure-blob-upload" \
      homepage="https://github.com/karlsgate/azure-blob-upload" \
      maintainer="Brian Mullin <brian.mullin@karlsgate.com>"

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

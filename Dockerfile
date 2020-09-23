FROM mcr.microsoft.com/azure-cli:2.9.1

LABEL "com.github.actions.name"="azure-blob-upload-action"
LABEL "com.github.actions.description"="Uploads local files to Azure Blob Storage containers"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="blue"
LABEL "repository"="https://github.com/karlsgate/azure-blob-upload-action"
LABEL "homepage"="https://github.com/karlsgate/azure-blob-upload-action"
LABEL "maintainer"="Brian Mullin <brian.mullin@karlsgate.com>"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

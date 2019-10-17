FROM docker.io/hashicorp/terraform:0.12.10

# https://github.com/Azure/azure-cli/issues/8863#issuecomment-477398239

RUN apk add --no-cache curl tar openssl sudo bash jq python3

RUN apk --update --no-cache add postgresql-client postgresql

RUN apk add --virtual=build gcc libffi-dev musl-dev openssl-dev make python3-dev

RUN pip3 install virtualenv &&\
    python3 -m virtualenv /azure-cli

ARG AZURE_CLI_VERSION=2.0.75

RUN /azure-cli/bin/python -m pip --no-cache-dir install azure-cli==${AZURE_CLI_VERSION}

RUN rm -rf /tmp

ADD ./scripts/az /usr/bin/az

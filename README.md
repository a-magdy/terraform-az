# Terraform AZ

Install AZ cli on a terraform container

The main use is to be able to use terraform null resource to run custom az commands

This is following [this comment on GitHub](https://github.com/Azure/azure-cli/issues/8863#issuecomment-477398239)

```text
marstr commented on 28 Mar
Howdy @revanthalampally,

Tinkering with your Dockerfile just a little, updating it to the following:

FROM alpine:3.9

RUN apk add --no-cache curl tar openssl sudo bash jq python3

RUN apk --update --no-cache add postgresql-client postgresql

RUN apk add --virtual=build gcc libffi-dev musl-dev openssl-dev make python3-dev

RUN pip3 install virtualenv &&\
    python3 -m virtualenv /azure-cli

ARG AZURE_CLI_VERSION=2.0.61

RUN /azure-cli/bin/python -m pip --no-cache-dir install azure-cli==${AZURE_CLI_VERSION}
I can successfully invoke the cli by running:

/azure-cli/bin/python -m azure.cli <args>
You could then create a basic launcher by putting the following in /usr/bin/az:

#!/usr/bin/env sh

/azure-cli/bin/python -m azure.cli "$@"
```

FROM alpine:3.17.3

# install git
RUN apk add --no-cache git

COPY tfsec /usr/bin/tfsec

## use a non-privileged user
RUN adduser -D tfsec
USER tfsec

# set the default entrypoint -- when this container is run, use this command
ENTRYPOINT [ "tfsec" ]
# as we specified an entrypoint, this is appended as an argument (i.e., `tfsec --help`)
CMD [ "--help" ]

@"
FROM ruby:3.2-alpine3.17

# Install imap-backup
RUN set -eux; \
    gem install imap-backup -v $( $VARIANT['_metadata']['package_version'] ); \
    imap-backup help > /dev/null

# Make the data directory a volume
WORKDIR /root
VOLUME ["/root/.imap-backup"]

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
"@
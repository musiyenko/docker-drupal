FROM drupal:9.1.3-php8.0-apache

LABEL maintainer="www.sy.mk"

# Updates and tools
RUN apt-get update && \
    apt-get install -y git wget && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/*

# Mailhog
RUN wget https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64
RUN chmod +x mhsendmail_linux_amd64
RUN mv mhsendmail_linux_amd64 /usr/bin/mhsendmail
RUN echo "sendmail_path = '/usr/bin/mhsendmail --smtp-addr=mailhog:1025'" > /usr/local/etc/php/conf.d/mailhog.ini

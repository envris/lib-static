FROM httpd:2

MAINTAINER Department of the Environment <devops@ris.environment.gov.au>

COPY ./apps ${HTTPD_PREFIX}/htdocs/apps/
COPY ./includes ${HTTPD_PREFIX}/htdocs/includes/
COPY ./lib /var/lib/

# change listening port and allow http daemon access to files
RUN sed -i 's/Listen 80/Listen 8080/g' ${HTTPD_PREFIX}/conf/httpd.conf && \
  chown -R daemon:www-data ${HTTPD_PREFIX} && \
  chmod -R g+r ${HTTPD_PREFIX}

EXPOSE 8080

CMD ["/var/lib/entrypoint.sh"]
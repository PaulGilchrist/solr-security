# docker build --rm -f "Dockerfile" -t paulgilchrist/solr:latest .
# docker run -d -p 8983:8983 paulgilchrist/solr:latest
# Connect to manament UI at http://localhost:8983 usign user=solr and password=SolrRocks
# Add new user and grant "admin" role
# Logout "solr" user and login new user
# Remove "solr" user
# Connect to container console and read new security.json file to use for next deployment
#    cat /var/solr/data/security.json
# Copy security.json file out of container and use for all subsequent container builds to maintain custom security
FROM solr:latest
ENV SOLR_USER="solr" \
    SOLR_GROUP="solr"
COPY --chown=solr:solr ./security.json /var/solr/data/security.json
EXPOSE 8983 8983
# docker push paulgilchrist/solr:latest

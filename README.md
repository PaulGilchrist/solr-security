# solr-security
Document how to add security to Solr Docker containers (also applies when not using Docker)

## Steps

1. Build new Docker image using Dockerfile in this project.  This will add default security to Solr, but with a well known username and password
```cmd
docker build --rm -f "Dockerfile" -t paulgilchrist/solr:latest .
```
2. Run Docker container
```cmd
# docker run -d -p 8983:8983 paulgilchrist/solr:latest
```
3. Connect to manament UI at http://localhost:8983 usign user=`solr` and password=`SolrRocks`
4. Add new user and grant "admin" role
5. Logout `solr` user and login new user
6. Remove `solr` user
7. Connect to container's console and read new `security.json` file to use for next deployment
```cmd
cat /var/solr/data/security.json
```
8. Copy `security.json` file out of container and use for all subsequent container builds to maintain custom security
9. Publish new container to container registry
```cmd
docker push paulgilchrist/solr:latest
```
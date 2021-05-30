FROM httpd:2.4
# Copy the static page from the target directory to apache2 docs
COPY ./index.html /usr/local/apache2/htdocs/
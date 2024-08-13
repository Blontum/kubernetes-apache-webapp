# Use Fedora as the base image
FROM fedora

# Set metadata for the image
LABEL maintainer="bo lontum"
LABEL description="This Dockerfile installs and manages Apache"

# Update the system and install Apache HTTP Server
RUN yum -y update && yum install -y httpd

# Copy the index file to the container
COPY index.html /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache HTTP Server in the foreground
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]

FROM phusion/passenger-ruby25:latest

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

RUN rm /etc/nginx/sites-enabled/default
ADD ./deployment_nginx_passenger/webapp.conf /etc/nginx/sites-enabled/webapp.conf
RUN mkdir /home/app/webapp
COPY --chown=app:app ./scomcat_app /home/app/scomcat_app

WORKDIR /home/app/scomcat_app

USER app
RUN bundle install
USER root
#RUN su - user -c "touch mine"

RUN rm -f /etc/service/nginx/down

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
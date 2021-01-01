FROM debian:buster

RUN apt-get update && apt-get install curl gnupg2 lsb-release software-properties-common -y
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - \
    && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
    && apt-get update && apt-get install waypoint -y
RUN apt-get --purge remove curl lsb-release software-properties-common gnupg2 -y \ 
    && apt-get autoremove -y && apt-get autoclean
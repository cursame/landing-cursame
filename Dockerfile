FROM ubuntu:latest

MAINTAINER cursame "https://github.com/alfredo777"

# Install packages for building ruby
RUN apt-get update
RUN apt-get install -y --force-yes build-essential wget git
RUN apt-get install -y --force-yes zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev
RUN apt-get clean
RUN apt-get install -y --force-yes git-core curl zlib1g-dev libreadline-dev libsqlite3-dev sqlite3 libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

# Install Ruby
RUN wget -P /root/src http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz
RUN cd /root/src; tar xvf ruby-2.2.0.tar.gz
RUN apt-get remove  -y --force-yes gcc
RUN apt-get install -y --force-yes  gcc-4.6 g++-4.6
RUN ln -s /usr/bin/gcc-4.6 /usr/bin/gcc
RUN ln -s /usr/bin/g++-4.6 /usr/bin/g++
RUN cd /root/src/ruby-2.2.0; ./configure; make install
RUN gem update --system
RUN gem install bundler
RUN gem install shotgun
# Intall GIT
RUN apt-get install -y --force-yes git
RUN mkdir /root/.ssh/


# Clone Repo and install 
RUN git clone https://55334a7f8de2cca03cc6144eb5cb5aa4877110c3@github.com/cursame/landing-cursame /root/sinatra
RUN cd /root/sinatra; bundle install
RUN  gem install foreman
RUN  gem install foreman_docker

EXPOSE 4567
#RUN cd /root/sinatra; foreman start -f ./Procfile
CMD ["/usr/local/bin/foreman","start","-d","/root/sinatra"]
#vagrant init gajdaw/sinatra; vagrant up --provider virtualbox

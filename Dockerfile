FROM ubuntu
RUN apt-get update
RUN apt-get install -y python
RUN echo 1.0 >> /etc/version && apt-get install -y git \
    && apt-get install -y iputils-ping
RUN mkdir /datos
WORKDIR /datos
RUN touch f1.txt
RUN mkdir /datos1
WORKDIR /datos1

#ADD
ADD docs docs
ADD f* /datos/
COPY f.tar .

#ENV
ENV dir=/data  dir1=/data1
RUN mkdir $dir

#ARG
#ARG dir2
#RUN mkdir $dir2
#ARG user
#ENV user_docker $user
#ADD add_user.sh /datos1
#RUN /datos1/add_user.sh


#EXPOSE
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y apache2
EXPOSE 80
ADD entrypoint.sh /datos1
##CMD
CMD /datos1/entrypoint.sh 

#ENTRYPOINT
#ENTRYPOINT ["/bin/bash"] 

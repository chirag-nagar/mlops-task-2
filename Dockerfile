FROM centos

RUN yum install java-11-openjdk.x86_64 -y

RUN echo -e "\
[jenkins]\n\
name=Jenkins-stable\n\
baseurl=http://pkg.jenkins.io/redhat-stable\n\
gpgcheck=1" >>/etc/yum.repos.d/jenkins.repo

RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

RUN yum install jenkins --nobest -y

RUN echo -e "jenkins    ALL=(ALL)       NOPASSWD: ALL" >>/etc/sudoers

EXPOSE 8080

CMD java -jar /usr/lib/jenkins/jenkins.war


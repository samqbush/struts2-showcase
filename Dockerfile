FROM tomcat:8.5.55-jdk8-openjdk

COPY . .

RUN curl -LJO https://mirrors.ocf.berkeley.edu/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz && \
    tar -xvf ./apache-maven-3.6.3-bin.tar.gz -C /opt && \
    ln -s /opt/apache-maven-3.6.3 /opt/maven && \
    rm ./apache-maven-3.6.3-bin.tar.gz
ENV M2_HOME /opt/maven
ENV MAVEN_HOME /opt/maven
ENV PATH ${M2_HOME}/bin:${PATH}
ENV MAVEN_CONFIG /root/.m2

RUN mvn clean package ; cp target/*.war /usr/local/tomcat/webapps/

CMD ["catalina.sh","run"]
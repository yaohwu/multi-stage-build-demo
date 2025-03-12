FROM eclipse-temurin:8u442-b06-jdk-focal as builder

RUN mkdir /opt/app

# nxc
COPY nxc/target/nxc-1.0.jar /opt/app/app.jar

FROM eclipse-temurin:8u442-b06-jdk-focal

RUN mkdir /opt/app

# xc
RUN rm -rvf /opt/app/app.jar;
COPY xc/target/xc-1.0.jar /opt/app/app.jar

# same env and cmd
CMD ["java", "-jar", "/opt/app/app.jar"]

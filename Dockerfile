FROM eclipse-temurin:8u442-b06-jdk-focal AS origin

RUN mkdir /opt/app

# other jar file
COPY nxc/target/classes/random_file.zip /opt/app/random_file.zip

# nxc
COPY nxc/target/nxc-1.0.jar /opt/app/app.jar

# same env and cmd
CMD ["java", "-jar", "/opt/app/app.jar"]

FROM eclipse-temurin:8u442-b06-jdk-focal AS builder

RUN mkdir /opt/app

# xc
COPY --from=origin /opt/app/random_file.zip /opt/app/random_file.zip

RUN rm -rvf /opt/app/app.jar;
COPY xc/target/xc-1.0.jar /opt/app/app.jar

# same env and cmd
CMD ["java", "-jar", "/opt/app/app.jar"]

FROM eclipse-temurin:8u442-b06-jdk-focal
RUN mkdir /opt/app

COPY --from=builder /opt/app/ /opt/app/

# RUN cp /opt/app/app.jar /opt/app/app.jar2 && rm -rvf /opt/app/app.jar2

# RUN cp /opt/app/app.jar /opt/app/app.jar3
# RUN rm -rvf /opt/app/app.jar3

CMD ["java", "-jar", "/opt/app/app.jar"]


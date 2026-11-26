FROM maven:3.9-eclipse-temurin-17 AS build 
ADD . /Ecr
WORKDIR /Ecr
RUN mvn clean package

FROM eclipse-temurin:25-alpine AS runtime
COPY --from=build /Ecr/target/*.jar devops/dev.jar
WORKDIR /devops
EXPOSE 8083
CMD ["java","-jar","dev.jar"]

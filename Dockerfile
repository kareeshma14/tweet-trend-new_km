FROM openjdk:17
ADD  jarstaging/com/valaxy/demo-workshop/2.1.3/demo-workshop-2.1.3.jar ttjob.jar
ENTRYPOINT ["java", "-jar", "ttjob.jar"]
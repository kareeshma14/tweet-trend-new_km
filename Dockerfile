FROM openjdk:17
ADD  jarstaging/com/valaxy/demo-workshop/2.1.4/demo-workshop-2.1.4.jar ttjob.jar
ENTRYPOINT ["java", "-jar", "ttjob.jar"]
FROM adoptopenjdk/openjdk11
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
COPY dd-java-agent.jar dd-java-agent.jar 
ENV DD_AGENT_HOST datadog-agent
ENV DD_TRACE_DEBUG true
ENTRYPOINT ["java","-javaagent:dd-java-agent.jar", "-jar","/app.jar"]

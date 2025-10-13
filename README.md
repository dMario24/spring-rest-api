# SPRING-REST-API

## Test
```bash
$ curl http://localhost:8080/hello | jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   116    0   116    0     0  11583      0 --:--:-- --:--:-- --:--:-- 12888
{
  "koreatime": "2025-10-01T14:11:23.997125035+09:00[Asia/Seoul]",
  "timesptamp": 1759295483997,
  "message": "Hello, World!"
}
```

<img width="1269" height="454" alt="image" src="https://github.com/user-attachments/assets/e0d7abcb-8b66-4cc3-ba87-1f76f2a57ead" />


## Build
```bash
$ ./gradlew clean bootJar
```

## Run
```bash
$ java -jar build/lib/spring-rest-api-<VERSION>.jar
```

## Remote Run
```bash
# scp -i <KEY.pem> start.sh ubuntu@<SERVER_IP>:~/app/spring-rest-api

$ ssh -i <KEY.pem> ubuntu@<SERVER_IP> \
"cd /home/ubuntu/app/spring-rest-api;pwd;./start.sh"
```

## Remote Stop 
```bash
# scp -i <KEY.pem> stop.sh ubuntu@<SERVER_IP>:~/app/spring-rest-api

$ ssh -i <KEY.pem> ubuntu@<SERVER_IP> \
"cd /home/ubuntu/app/spring-rest-api;pwd;./stop.sh"
```

## Dockerizing
- https://spring.io/guides/gs/spring-boot-docker
- openJDK 17
```bash
# 빌드
$ ./gradlew clean bootJar
$ sudo docker build --build-arg JAR_FILE=build/libs/\*.jar \
-t datamario24/spring-rest-api:0.3.0 .

# Run
# sudo docker run -d -p 8030:8080 --name srq030 datamario24/spring-rest-api:0.3.0

$ sudo docker images | grep spring-rest-api
datamario24/spring-rest-api   0.3.0           df8b2c938eac   43 seconds ago   347MB

$ sudo docker push datamario24/spring-rest-api:0.3.0

$ sudo docker status

```

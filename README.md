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

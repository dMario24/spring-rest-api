#!/bin/bash
# ----------------------------------------------------
# Java 백그라운드 서비스 시작 스크립트 (start.sh)
# 실행: ./start.sh
# ----------------------------------------------------

# 실행할 JAR 파일 이름 (스크립트와 같은 경로에 있어야 함)
JAR_FILE="app.jar"
# 로그를 저장할 파일 경로
LOG_FILE="./app_start.log"

echo "--- $JAR_FILE 서비스 시작 중 ---"

# 이미 실행 중인 프로세스가 있는지 확인 (pgrep -f는 명령줄 전체에서 JAR 파일명을 찾음)
PID=$(pgrep -f "$JAR_FILE")

if [ -n "$PID" ]; then
    echo "[$JAR_FILE] 서비스가 이미 실행 중입니다. (PID: $PID)"
    echo "서비스를 중지하려면 stop.sh를 실행하세요."
else
    # nohup: 세션이 종료되어도 프로세스가 계속 실행되도록 합니다.
    # > $LOG_FILE 2>&1: 표준 출력과 표준 에러를 로그 파일로 리디렉션합니다.
    # &: 명령을 백그라운드로 실행합니다.
    nohup java -jar "$JAR_FILE" > "$LOG_FILE" 2>&1 &
    
    # 프로세스 시작 후 PID 확인을 위해 잠시 대기
    sleep 2
    
    NEW_PID=$(pgrep -f "$JAR_FILE")
    
    if [ -n "$NEW_PID" ]; then
        echo "[$JAR_FILE] 서비스가 백그라운드에서 성공적으로 시작되었습니다. (PID: $NEW_PID)"
        echo "로그 파일: $LOG_FILE"
    else
        echo "[$JAR_FILE] 서비스 시작에 실패했습니다. 로그 파일($LOG_FILE)을 확인하십시오."
    fi
fi

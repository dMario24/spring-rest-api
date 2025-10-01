#!/bin/bash
# ----------------------------------------------------
# Java 백그라운드 서비스 중지 스크립트 (stop.sh)
# 실행: ./stop.sh
# ----------------------------------------------------

# 중지할 JAR 파일 이름 (start.sh와 동일해야 함)
JAR_FILE="app.jar"

echo "--- $JAR_FILE 서비스 중지 중 ---"

# 실행 중인 프로세스의 PID를 찾습니다.
PID=$(pgrep -f "$JAR_FILE")

if [ -z "$PID" ]; then
    echo "[$JAR_FILE] 서비스가 실행 중이지 않습니다."
else
    echo "[$JAR_FILE] 실행 중인 프로세스를 발견했습니다. (PID: $PID)"
    echo "프로세스 종료 신호(SIGTERM) 전송 중..."
    
    # 프로세스에 종료 신호(SIGTERM)를 보냅니다.
    kill "$PID"
    
    # 프로세스가 완전히 종료될 때까지 최대 10초 대기
    COUNT=0
    while kill -0 "$PID" 2>/dev/null; do
        sleep 1
        COUNT=$((COUNT + 1))
        
        if [ "$COUNT" -ge 10 ]; then
            echo "프로세스가 10초 내에 종료되지 않았습니다. 강제 종료(kill -9) 시도..."
            kill -9 "$PID"
            break
        fi
    done
    
    if [ -z "$(pgrep -f "$JAR_FILE")" ]; then
        echo "[$JAR_FILE] 서비스가 성공적으로 중지되었습니다."
    else
        echo "[$JAR_FILE] 서비스 중지에 실패했습니다."
    fi
fi


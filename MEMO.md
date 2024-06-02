## KUBE

    - minikube service story-service --url :: 서비스 주소 얻기

## command line

    docker build {DOCKERFILE} -t {NAME:TAG}
    - 이미지 빌드
    docker exec
    - 컨테이너에 접속
    docker-compose build {SERVICE_NAME?}
    docker-compose up
    docker-compose run --rm {SERVICE_NAME} {}
    - 유틸리티 컨테이너

## docker file

    ENTRYPOINT ['npm']
    - CMD는 덮어쓰지만 ENTRYPOINT는 파라미터를 이어서 붙힌다.

## 볼륨

    익명 볼륨 : --rm 태그가 있는 컨테이너 일 경우 종료 시 같이 삭제
    명명 볼륨 : 계속 남아 있음
    바인드 마운트 : 호스트 폴더를 연결 할 경우 사용

## 예제

    docker run -d --rm -p 4000:80 --name feedback-app \
    -v feedback:/app/feedback \
    -v "C:\Work\Study\Udemy\docker_complete\data-volumes-01-starting-setup:/app" \
    -v /app/node_modules \
    feedback-node

## 네트워크

    docker network create ${NAME}
    docker run --network ${NETWORK_NAME} ${IMAGE_NAME}

## 컨테이너 -> host 통신

    localhost X | host.docker.internal O

# docker compose example

    version: '3.8'
    services:
      mongodb:
        image: 'mongo'
        volumes:
          - data:/data/db
        env_file:
          - ./env/mongo.env
    		container_name:mongodbGood
      backend:
        build: ./backend
        # build:
        #   context: ./backend
        #   dockerfile: Dockerfile
        #   args:
        #     some-arg: 1
        ports:
          - '80:80'
        volumes:
          - logs:/app/logs
          - ./backend:/app
          - /app/node_modules
        env_file:
          - ./env/backend.env
        depends_on:
          - mongodb
      frontend:
        build: ./frontend
        ports:
          - '3000:3000'
        volumes:
          - ./frontend/src:/app/src
        depends_on:
          - backend
        # -it 옵션과 동일
        stdin_open: true
        tty: true
    volumes:
      data:
      logs:

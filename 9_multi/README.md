### STEP

    ## Backend
        - docker build -t goals-node ./backend
        - docker tag goals-node nameofokja/goals-node
        - docker push nameofokja/goals-node
    ##

    ## Frontend
        - docker build -f frontend/Dockerfile.prod -t goals-react ./frontend
        - docker tag goals-react nameofokja/goals-react
        - docker push nameofokja/goals-react
    ##

    ## AWS
        - create aws ECS cluster

        - create aws ECS Task definitions
            > add backend container
                - Docker configuration
                    > command : node, app.js
                - setting env

        - create aws ECS Task definitions
            > add frontend container


        - create service // maybe
            >> Compute options : Launch type :: FARGATE
    ##

### MEMO

    ECS에서는 컨테이너를 띄우면 같은 도커 네트워크를 사용한다

    DB는 별도로 분리해서 쓰는 게 좋다.
        > MongdoDB의 경우 Atlas..

    멀티 스테이지는 맨 마지막 스테이지가 중심으로
    그 전 스테이지들 에서 필요한 것만 copy해서 사용

    docker build --target build -f frontend/Dockerfile.prod -t goals-react ./frontend
        > 멀티 스테이지에 특정 스테이지로 이미지 빌드 할 수 있음!

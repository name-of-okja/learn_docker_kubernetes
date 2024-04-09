### STEP

    - docker build -t goals-node ./backend
    - docker tag goals-node nameofokja/goals-node
    - docker push nameofokja/goals-node

    ## AWS
        - create aws ECS cluster
        - create aws ECS Task definitions

        > backend container
            - Docker configuration
            - - command : node, app.js
            - setting env
                >> MONGODB_URL 의 경우 localhost로 해야한다

        > mongodb container
            - port : 27017
            - setting env

        - create service // maybe
            >> Compute options : Launch type :: FARGATE
    ##

### INFO

    ECS에서 컨테이너를 띄우면 같은 도커 네트워크를 사용한다

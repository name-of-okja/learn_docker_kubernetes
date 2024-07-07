### Section 1 :: Pod 내부 통신

    - docker-compose up -d --build

    - cd users-api
    - docker build -t nameofokja/kube-test-users .
    - docker push nameofokja/kube-test-users

    - cd auth-api
    - docker build -t nameofokja/kube-test-auth .
    - docker push nameofokja/kube-test-auth

    - cd kubernetes
    - kubectl apply -f .\users-deployment.yaml
    - kubectl apply -f .\users-service.yaml
    - minikube service users-service

### Section 2 :: Pod 간 외부 통신

    - kubectl apply -f .\auth-service.yaml -f .\auth-deployment.yaml
    - users-app.js 수정 후 적용을 위해 kubectl delete -f .\users-deplyoment.yaml kubectl apply -f .\users-deloyemnt.yaml

### Section 3 :: 챌린지

    - docker build -t nameofokja/kube-test-tasks .
    - docker push nameofokja/kube-test-tasks
    - kubectl apply -f .\tasks-service.yaml -f .\tasks-deployment.yaml
    - tasks pod 에러 CrashLoopBackOff
    >> docker-compose에는 TASKS_FOLDER 변수가 있는데 쿠버에서는 확인이 불가능 한 변수 (task-app.js에 사용중인 변수임)여서 tasks-deployemnt.yaml 파일에 TASKS_FOLDER 변수 등록

    - minikube service tasks-service :: 해당 서비스 주소를 가져오기 위해서(실행시키기 위한 목적이 아님 실행은 apply에서 함, 다만 노출을 minikube로 외부 노출을 하는 것 )

### Section 4 :: 프론트엔드 추가

    - docker build -t nameofokja/kube-test-frontend .
    - docker run -p 80:80 -d --rm nameofokja/kube-test-frontend
    >> CQRS 에러 발생 됨 tasks-api에 cqrs 허용 하고 다시 빌드 실행
    - docker push nameofokja/kube-test-frontend

    - kubectl apply -f .\frontend-service.yaml -f .\frontend-deployment.yaml

### MEMO

    - service의 spec type 이 ClusterIP 일 경우 클러스터 내부로 부터만 접근 할 수 있는 서비스가 됨 :: 즉 외부에서는 접근이 불가능함
    - serivce의 spec type 이 NodePart 일 경우 외부에서 연결 할 수 있는 서비스가 됨
      실제로 노드 IP를 이용해서 여러 노드와 포트가 잇는 경우 좋치 못함
      예를 들어, 복제본이 다른 노드에 생성되면 IP가 달라져서 문제가 생김

    - deployment 파일이 다른 경우 서로 다른 pod으로 생성함
    - service name 에 맞게 자동으로 쿠버네티스가 IP 환경변수가 만듬
        ex. auth-service => AUTH_SERVICE_SERVICE_HOST
        ex. users-service => USERS_SERVICE_SERVICE_HOST

    - 도커 이미지를 다시 땡겨오고 싶으면 kubectl delete -f deployment.yaml 로 삭제 후 kubectl apply -f deployment.yaml 로 새롭게 적용 하면 땡겨옴

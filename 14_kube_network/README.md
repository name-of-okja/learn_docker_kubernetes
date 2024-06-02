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

### MEMO

    - service의 spec type 이 ClusterIP 일 경우 클러스터 내부로 부터만 접근 할 수 있는 서비스가 됨
    - serivce의 spec type 이 NodePart 일 경우 외부에서 연결 할 수 있는 서비스가 됨
      실제로 노드 IP를 이용해서 여러 노드와 포트가 잇는 경우 좋치 못함
      예를 들어, 복제본이 다른 노드에 생성되면 IP가 달라져서 문제가 생김

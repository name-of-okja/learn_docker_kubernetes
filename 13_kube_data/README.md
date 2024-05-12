### Section 1 ::

    - docker build -t nameofokja/kube-story-data .
    - docker push nameofokja/kube-story-data
    - kubectl apply -f deployment.yaml -f service.yaml
    - minikube service story-service

### MEMO

    - minikube service story-service --url :: 서비스 주소 얻기

    - volumes.emptyDir: {} :: Pod가 시작될 때 마다 단순히 새로운 빈 디렉토리를 생성, Pod 제거 되면 같이 삭제 됨
        추가로 Pod에 종속 되다보니 다른 Pod에서는 해당 폴더를 못 읽음
    - volumes.hostPath :: 해당 머신에 volume이 생김 emptyDir와 다르게 같은 머신 이면 Pod 끼리 공유 가능, 대신 노드가 다른 경우에는 접근이 불가능함

### Section 1 :: 명령적 접근방식

    [Docker Image]
    - docker build -t kube-first-app .
    - docker tag kube-first-app nameofokja/kube-first-app
    - docker push nameofokja/kube-first-app

    [Kube]
    - kubectl create deployment first-app --image=nameofokja/kube-first-app
    - minikube dashboard

    - kubectl expose deployment first-app --type=LoadBalancer --port=8080
    - minikube service first-app
    - kubectl scale deployment/first-app --replicas=3 :: 3개의 팟을 띄운다
    - kubectl scale deployment/first-app --replicas=1

    ## 소스코드 업데이트
    - Docker image push ~~ :: 새로운 태그로
    - kubectl set image deployment/first-app kube-first-app=nameofokja/kube-first-app:2

    ## 에러 롤백
    - kubectl rollout status deployment/first-app :: 상태 확인
    - kubectl rollout undo deployment/first-app :: 롤백
    - kubectl rollout history deployment/first-app --revision=2 :: 히스토리 확인 (커밋 확인 느낌?)
    - kubectl rollout undo deployment/first-app --to-revision=1 :: (해당 커밋으로 롤백하는 느낌 ..?)

    ## 서비스 삭제
    - kubectl delete service first-app
    - kubectl delete deployment first-app

### Section 2 :: 선언적 접근방식

    - kubectl apply -f deployment.yaml :: -f = 파일
    - kubectl apply -f service.yaml
    - minikube service backend-service

    ## Deployment 수정
    - deployment.yaml 수정
    - kubectl apply -f deployment.yaml

    ## 삭제
    - kubectl delete -f deployment.yaml -f service.yaml

### Section 3 :: 다중 vs 단일 Config

    - kubectl apply -f master-deployment.yaml
    - minikube service backend-service
    - kubectl delete -f master-deployment.yaml

### MEMO

    - kubectl get deployments
    - kubectl get pods
    - kubectl get services
    - kubectl delete deployment ${NAME}

    - selector.matchLabels에 명시 된 모든 라벨들이 있는 템플릿만 selector

    - 단일 Config 파일에서 섹션 구분은 '---'
    - 단일 Config 파일에서 service가 먼저 생성되는게 좋은 선택지 이다.
        (selector 덕분에 동적으로 deployment랑 바인딩 됨)

    - kubectl delete -l group=exampe :: label group 이 example인 service와 deployment 삭제
    - kubectl delete deployment,services -l group=exampe :: label group 이 example인 service와 deployment 삭제

### DashBoard <Docker Desktop>

    LINK :: https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md

    - kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.6.1/aio/deploy/recommended.yaml  >> install
    - kubectl proxy >> Dashboard on
    - http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

    [Auth]
    - kubectl apply -f dashboard-adminuser.yaml
    - kubectl apply -f cluster-role-binding.yaml
    - kubectl -n kubernetes-dashboard create token admin-user
    [Clean]
    - kubectl -n kubernetes-dashboard delete serviceaccount admin-user
    - kubectl -n kubernetes-dashboard delete clusterrolebinding admin-user

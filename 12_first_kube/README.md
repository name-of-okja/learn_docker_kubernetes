### STEP

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

### MEMO

    - kubectl get deployments
    - kubectl get pods
    - kubectl get services
    - kubectl delete deployment ${NAME}

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

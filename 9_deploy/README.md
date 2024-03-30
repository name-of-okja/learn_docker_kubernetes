### 예제로 시작하기 :: 127

- docker build -t node-dep-example .
- docker run -d --rm --name node-dep -p 80:80 node-dep-example

### ec2에 docker 설치 :: 132

- amazon linux에 docker 설치 방법
  https://stackoverflow.com/questions/53918841/how-to-install-docker-on-amazon-linux2

### docker hub에 이미지 push :: 134

- docker build -t node-dep-example-1 .
- docker tag node-dep-example-1 nameofokja/node-test-1
- docker push nameofokja/node-test-1
- - aws 터미널 접속
- sudo docker run -d --rm -p 80:80 nameofokja/node-test-1 \
  이미지 땡기기 docker pull nameofokja/node-test-1

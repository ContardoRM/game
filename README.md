# game

docker login cencoreg:5000
docker build --no-cache -t cencoreg:5000/devops/alpine_game .
docker push cencoreg:5000/devops/alpine_game
docker logout cencoreg:5000

# docker rmi xmrigccserver:latest -f
docker build -f Dockerfile-Server --tag xmrigserver:latest .
echo "built xmrigserver:latest success"

echo "testing xmrigserver"
docker run --rm -i -v ${pwd}:/xmrigcc xmrigserver:latest xmrigserver -h

echo "testing xmrigdaemon"
docker run --rm -i -v ${pwd}:/xmrigcc xmrigserver:latest xmrigdaemon -h


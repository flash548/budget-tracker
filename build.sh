if [ -z $HOST_BACK ]; then
    HOST_BACK='localhost';
    export HOST_BACK;
fi;

if [ -z $PORT_BACK ]; then
    PORT_BACK=8080;
    export PORT_BACK;
fi;

if [ -z $PORT_FRONT ]; then
    PORT_FRONT=80;
    export PORT_FRONT;
fi;

if [ -z $HOST_FRONT ]; then
    HOST_FRONT='localhost';
    export HOST_FRONT;
fi;

chmod +x frontend/build.sh
cd frontend && ./build.sh && cd ..
docker-compose build && docker-compose up -d
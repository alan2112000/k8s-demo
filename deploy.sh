docker build -t alan2112000/multi-client -f ./client/Dockerfile ./client 
docker build -t alan2112000/multi-server -f ./server/Dockerfile ./server
dokcer build -t alan2112000/multi-worker -f ./worker/Dockerfile ./worker
docker push alan2112000/multi-client 
docker push alan2112000/multi-server
docker push alan2112000/multi-worker

kubelctl apply -f k8s 
kubectl set image deployments/server-deployment server=alan2112000/multi-server


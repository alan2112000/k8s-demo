docker build -t alan2112000/multi-client -t alan2112000/multi-client:$SHA -f ./client/Dockerfile ./client 
docker build -t alan2112000/multi-server -t alan2112000/multi-server:$SHA -f ./server/Dockerfile ./server
dokcer build -t alan2112000/multi-worker -t alan2112000/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push alan2112000/multi-client:latest
docker push alan2112000/multi-server:latest
docker push alan2112000/multi-worker:latest

docker push alan2112000/multi-client:$SHA
docker push alan2112000/multi-server:$SHA
docker push alan2112000/multi-worker:$SHA

kubectl apply -f k8s 
kubectl set image deployments/server-deployment server=alan2112000/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=alan2112000/multi-worker:$SHA
kubectl set image deployments/client-deployment client=alan2112000/multi-client:$SHA
 

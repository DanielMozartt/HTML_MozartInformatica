sudo apt update

docker login

docker build -t mzhtml:v1 .
docker images

docker save mzhtml:v1 | sudo k3s ctr images import -
sudo k3s ctr images ls | grep mzhtml

echo 'alias kubectl="sudo k3s kubectl"' >> ~/.bashrc
source ~/.bashrc

kubectl apply -f deploymentk3s.yaml

kubectl get pods

kubectl get svc

kubectl apply -f servicesk3s.yaml

kubectl port-forward svc/mzhtml-service 8080:80

cmd.exe /C start http://localhost:8080

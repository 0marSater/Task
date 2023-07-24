## Task

This project contain 4 folders
1. ***mongodb-chart***: helm chart to install mongodb on AWS EKS.
2. ***sqlserver-chart***: helm chart to install sql server db on AWS EKS.
3. ***redis-chart***: helm chart to install redis on AWS EKS.
4. ***terraform***: contain necessary configuration to provision the whole infrastructure
5. ***app***: contain the code itself, Dockerfile, Ingress.yaml and deployment.yaml
-------------------------------------------------------------------------------------
#First
------
- Navigate to terraform folder
- do ` terraform apply --auto-approve ` to create the infrastructure.
- deteils explained inside README file inside terraform folder (strcutre and modules)

#Second 
-------
- ___***You need to build the web app and push it to the ECR that created by terraform***___
- Navigate to ***/app/aspnetapp*** and do `kubectl apply -f deployment.yaml` that will deploy the app on ***EKS*** by pulling its image from ***ECR*** and `kubectl apply -f Ingress.yaml`, this will deploy Ingress to acccess the app.

#Third 
------
- Navigate to install helm charts for mongodb-chart, sqlserver-chart, redis-chart by applying `helm install mongodb ./mongodb-chart`, `helm install sqlserver ./sqlserver-chart` and so on ..

NOTE: 
  - You need to deploy EBS CSI driver to allow eks to dynamically create EBS volumes to its PVs
  - `kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=master"`
  - Verify ebs-csi pods running `kubectl get pods -n kube-system`

Project diagram 
![Project digram](./Images/Diagram.png)

                               kubernetes- deployment- task
                               
                               
   To do this task, i used AWS EC2 Instances, and i Created kubernates cluster using Kops tool.
   
  How to setup the Cluster in Aws: ( steps) 
     1. choose the AWS region for deployment.
     2. I used EC2 Ubuntu 18.04 version.
     3.First install kubectl
     4.then Download the kops
     5. create a DNS , in route 53,- for identification of kubernetes cluster. (i created naveen.task.com)
     6.attach a roles to the Ubuntu instance with required privileges
     7.create a S3 bucket to store the artefacts required for the cluster
     8.Define a cluster configuration and review, and finally create a cluster.
     
  Deploying the our Application: (steps)
  
      Tomcat Web Application Server with a sample HTML Page

        - for this i used a Dockerfile which contains both the tomcat server with Html page.

        - and i converted that Dockerfile into a Docker Image and pushed it in to the DokcerHub
    
           you can see that Docker image in to below link:

            https://cloud.docker.com/u/11209905/repository/docker/11209905/task-naveen

       - there is index.html file is available which has a code
      -  context.xml and tomcat-users.xml is available in the repository. It helps to access the Tomcat with credentials from web   browser


      Any Database server of your choice ( preferably MongoDB or Couch DB)

      -  For this i used a Mongo Db offical Imge which is available in the Dockerhub.



     To deploy both web-application and Mongo Db in to the kubernates cluster i wrote a Yaml files.

     - for web application ( web.yaml, web-srv.yaml)
     - for Mongo Db         (mongo.yaml, mongo-srv.yaml)

     - i used a persistentvolume.yaml  to create a volume of 1GB In local
     - and persis-vol-claim.yaml   helps to claim that volume 


    I deployed both using the below commands in the kubernates cluster.

       kubectl create -f web.yaml web-srv.yaml mongo.yaml mongo-srv.yaml

   To Verify:

    kubectl get pods
    kubectl get svc

Loadbalancing in the cluster:
    
    - to expose the pods to the outside world.
    - you have to specify the Type as Load balancer (so, that it will create a load balancer in a aws )
      
      kubectl expose deployment (name of the deployment) --port=8080 --type=LoadBalancer   ( this command creates a Load Balncer in AWS)
      
      if you want to access the application , go to the loadbalancer in AWS dashboard and go the Description. you can find a DNS over there and  copy the DNS and hit it in the browser you can get a web page.
      
   
 Auto Scaling the Cluster: (steps)
   
     - Change the configuration file for either nodes or master.
     - update the cluster 


Dashboard for monitoring kubernetes infrastracture:


      To deploy Kubernates-Dashboard use below commad:
      
        $ kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml


     - In order to get the secret to unlock the Dashboard using below commond:
         
           kops get secrets kube --type secret -oplaintext
           
           now hit the DNS on user brower and you can get the dashboard.
           
           



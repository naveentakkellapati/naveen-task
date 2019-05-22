                               kubernetes- deployment- task


Tomcat Web Application Server with a sample HTML Page

- for this i used a Dockerfile which contains both the tomcat server with Html page.

- and i converted that Dockerfile into a Docker Image and pushed it in to the DokcerHub
    
   you can see that Docker image in to below link:


https://cloud.docker.com/u/11209905/repository/docker/11209905/task-naveen

- there is index.html file is available which has a code
-  context.xml and tomcat-users.xml is available with the code. It helps to access the Tomcat with credentials from web browser


Any Database server of your choice ( preferably MongoDB or Couch DB

-  For this i used a Mongo Db offical Imge which is available int he Dockerhub.



To deploy both web-application and Mongo Db in to the kubernates cluster i wrote a Yaml files.

- for web application ( web.yaml, web-srv.yaml)
- for Mongo Db         (mongo.yaml, mongo-srv.yaml)

- i wrote a persistentvolume.yaml  to create a volume of 1GB In local
- and persis-vol-claim.yaml   helps to claim that volume 


I deployed both using the below commands:

 kubectl create -f web.yaml web-srv.yaml mongo.yaml mongo-srv.yaml

To Verify:

    kubectl get pods
    kubectl get svc



I wrote a kubernetes-dashboard.yaml to access the dashboard from the browser

To deploy Kubernates-Dashboard use below commad:


kubectl apply -f  kubernetes-dashboard.yaml 


you can access this now from web-browser.

Finally, the ingress.yaml , which is helps to route the traffic

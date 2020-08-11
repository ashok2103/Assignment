# Assignment
Web server using nginx assignment


Starting this assignment with AWS Console.
NIGNX installtion on 2 unbuntu 18.4 instance 

Create 2 ubuntu instance with t2.micro	
In Configuration instace number of isntance is 2 and the network part is default one.
In advanced Details -> user data as text using the below commnad also we can use the same in file by giving the script name Nginx.sh.
#shell script
#!/bin/bash
#To upate the instance
sudo apt-get update
#To install nginx
sudo apt-get install -y nginx
#Creating the index file in nginx under /var/www/html/ with Hello-world
sudo sh -c 'echo "Hello-World" >> /var/www/html/index.html'
#starting the nginx service
sudo service nginx start



Tag crearted with Webserv1 and Webserv2

In configure security group creating a new security group name as nginxhttp and by below details are added

Type ssh tcp port 22  source is anywhere similallry added the same for http with 80 port and source is anywhere.

Created a new key pair with name nginx and downloaded the pem file. 


Now using Load balancer.

Load Balancer are of 3 types in AWS 
1. classic lb (elb) Elastic Load Balancer
      Can be used for Layer 4 & Layer 7
2. Application lb (alb)
      Can be used for Layer 7 loadbalancing
3. Network lb (nlb)
      Can be used for Layer 4 loadbalancing

Using ELB for load balancing the nginx server.

1.Creating classic LB:
Open load balancer in AWS console and select classic load balancer 
Used the below parameters:
Load Balancer name :Nginxlb
Using defult Vpc
Listener configuration :
LB protocol : HTTP
LB port: 80
Instance portocol: HTTP
Instance port :80 

2.Assign Security group:
Click create new security group 
Securit group name: onlyhttp
Type: custom TCP type: protocol TCP: port range :80 source custom.

3. Configure Health Check:
Ping Protocol
HTTP
Ping Port
80
Ping Path
/index.html
Advanced Details:
Response Timeout 
5
Interval 
10
Unhealthy threshold 
2
Healthy threshold 
5

4. Add tag 
key = NginxLB and value = Nginxwbserver

5. Review and create 
Now Nginxlb is created with the 2 nginx webserver.


Basic Configuration
Name
Nginxlb
DNS name
Nginxlb-199891426.us-west-2.elb.amazonaws.com (A Record)
Status
2 of 2 instances in service


Output: do curl with the Dns name even if one instance is down the output is the smae.
$ curl -k http://Nginxlb-199891426.us-west-2.elb.amazonaws.com
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    12  100    12    0     0     20      0 --:--:-- --:--:-- --:--:--    20Hello-World


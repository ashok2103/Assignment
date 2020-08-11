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

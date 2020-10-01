## Decription
This repo helps you with VM configuration for web applications. At the end your VM well be able to perform CI/CD.

## Note
Manual for CentOS. Use similar steps fro other unix OSs.

## Requrements
- Unix OS
- Your repo must have Dockerfile
- VM instance

## Capabilities
- Isolated Docker containers
- Webhooks (watching new commits)
- Autodeployment

## Preparations

1. #### Install some tools
- ```yum install git```
- ```yum install wget```
- ```yum install docker```

2. #### Install Go...
- ```wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz```
- ```tar -C /usr/local -xzf go1.13.linux-amd64.tar.gz```
- ```echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bash_profile```
- ```source ~/.bash_profile```

3. #### ...and install webhooks through snapcraft...
- ```yum install epel-release```
- ```yum install snapd```
- ```systemctl enable --now snapd.socket```
- ```sudo ln -s /var/lib/snapd/snap /snap```
- ```sudo snap install webhook```

4. #### ...and configure deployment webhook (don't worget to create webhook on GitHub)
5. #### Copy content of this repo (*deploy.sh*, *init.sh*, *hooks.json*) to */root* directory of your VM
6. #### Don't forget to add executable permissions to scripts
- ```chmod +x ~/init.sh```
- ```chmod +x ~/deploy.sh```

7. #### Start webhook http server
- ```/var/lib/snapd/snap/webhook/4/bin/webhook -hooks /root/hooks.json -verbose```

8. #### Start Docker service
- ```service docker start```

9. #### Configure Github
- Generate ssh key ```ssh-keygen```
- Copy key and add to GitHub (or another cloud repo) ```cat ~/.ssh/id_rsa.pub```
- Configure webhooks https://docs.github.com/en/free-pro-team@latest/developers/webhooks-and-events/creating-webhooks

10. #### Run init script
- ```sh ~/init.sh```














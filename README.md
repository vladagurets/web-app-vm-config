# Requirements for env (CentOS)

#### nstall some tools
```yum install git```
```yum install wget```
```yum install docker```
```service docker start```

#### Install Go...

```wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz```
```tar -C /usr/local -xzf go1.13.linux-amd64.tar.gz```
```echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bash_profile```
```source ~/.bash_profile```

#### ...and install webhooks through snapcraft...

```yum install epel-release```
```yum install snapd```
```systemctl enable --now snapd.socket```
```sudo ln -s /var/lib/snapd/snap /snap```
```sudo snap install webhook```

#### ...and configure deployment webhook (don't worget to create webhook on GitHub)

copy content of *build_assets* folder to */root*
Don't forget to add executable permissions to scripts
```chmod +x ~/init.sh```
```chmod +x ~/deploy.sh```

Don't forget to add server ssh key to GitHub

```sh ~/init.sh```
```/var/lib/snapd/snap/webhook/4/bin/webhook -hooks /root/hooks.json -verbose```














# firewalld

## install
```
sudo dnf install -y firewalld
# to start up firewall daemon
sudo sytemctl start firewalld
```

## add port/service
```
sudo firewall-cmd --add-port=8888/tcp
sudo firewall-cmd --add-service=http
# make it permanent
sudo firewall-cmd --add-port=8888/tcp --permanent
# for permanent configurations must restart daemon
sudo systemctl restart firewalld
# temporary configurations are lost after restart
```

## remove port/service
```
sudo firewall-cmd --remove-port=8888/tcp
sudo firewall-cmd --remove-service=http
```

## list ports/services
```
sudo firewall-cmd --list-ports
sudo firewall-cmd --list-services
```

#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y apt-transport-https software-properties-common wget
sudo apt-get install -y prometheus prometheus-node-exporter prometheus-pushgateway prometheus-alertmanager
sudo systemctl start prometheus
sudo systemctl enable prometheus
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt-get install -y grafana
sudo systemctl start grafana-server
sudo systemctl enable grafana-server
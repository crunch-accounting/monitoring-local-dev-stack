# Monitoring (Prometheus & Grafana) Local Dev stack

## Dependencies:

While not strictly required, this isn't much use until the Platform docker stack is running.


## Basic usage:

* Start with: `./start.sh`
* Temporarily stop with: `./stop.sh`
* Shut down with: `./down.sh`
* Pull latest images with: `./pull_latest_images.sh`
* Pull latest config / scripts with: `git pull`

## Working with Prometheus:

* To view metrics, visit: http://localhost:9990/graph.
* To modify targets, edit: `prometheus/prometheus.yml` and restart the `prometheus` container (simply type 'r' using [LZD](https://github.com/jesseduffield/lazydocker))
* [mysqld metrics](https://github.com/prometheus/mysqld_exporter) are also scraped from the Platform docker stack.

## Working with Alert Manager:

* To view alert rules, see: http://localhost:9990/alerts
* To add rules, edit: `prometheus/alert.rules` and restart the `alertmanager` container


## Working with Grafana:

* Login: http://localhost:3000/login (login: `admin` / `foobar`)
* A number of examples from the Security System are provided.
* There's also a dashboard for mysqld metrics.
* To add dashboards, copy `.json` files to: `grafana/provisioning/dashboards` and restart the `grafana` container


## Working with Prometheus Push Gateway:

* UI: http://localhost:9991

Use the [Gateway](https://github.com/prometheus/pushgateway) as a 'sink' to collect ad-hoc metrics from ephemeral tasks such as test or script runs. The metrics are scraped by Prometheus and are available for graphing or (unlikely!) alerting.

You will of course need a Prometheus metrics API to handle the message sending, but you can see a CLI example in the project [here](pushgateway_test.sh)


----

## Ideas/improvements:

* No automation around target discovery at all - though this may be possible
    * OTOH, as it's harmless to have broken targets, we could just seed this file with every possible service.
* No automation around alert rules at all - currently only copy/paste from project repo
    * Also, nothing on alert notifications. Perhaps for the best, but this could be made to work.
* No automation around Grafana dashboards at all - currently only copy/paste from project repo
    * OTOH this is pretty well the same way developers work with dashboards now.

## Caveats:

* Targets use `host.docker.internal` - tested on macOS only.
* This project is [a fork from here](https://github.com/vegasbrianc/prometheus).

## This is Kubernetes helm chart for Local Development

----
Create a local values-local.yaml:

```bash
cp helm/values-local.yaml.dist helm/values-local.yaml
```

```yaml
# enable\disable needed services:
mysql:
  release: true
```
Start
```bash
bash bin/start.sh --dep-update
```

Now you can use this environment in another services like:
```yaml
envs: 
  MYSQL_HOST: 'local-stack-mysql'
  RABBITMQ_HOST: 'local-stack-rabbitmq'
  REDIS_HOST: 'local-stack-redis'
  ELASTICSEARCH_HOST: 'local-stack-elasticsearch'
```








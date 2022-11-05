
cat >wechatrobot.yaml<<HFBEOF
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: wechatrobot
  name: wechatrobot
  namespace: monitoring
  #需要和alertmanager在同一个namespace
spec:
  replicas: 1
  selector:
    matchLabels:
      app: wechatrobot
  template:
    metadata:
      labels:
        app: wechatrobot
    spec:
      containers:
      - image: hefabao/wechatrobot:v0.0.1
        name: wechatrobot
        #上面创建的企业微信机器人hook
        ports:
        - containerPort: 8060
          protocol: TCP
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
          limits:
            cpu: 501m
            memory: 501Mi
      imagePullSecrets:
        - name: IfNotPresent
---
apiVersion: v1
kind: Service
metadata:
  labels:
    app: wechatrobot
  name: wechatrobot
  namespace: monitoring #需要和alertmanager在同一个namespace
spec:
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 8989
  selector:
    app: wechatrobot
  type: ClusterIP


HFBEOF

# kubectl delete -f wechatrobot.yaml
kubectl apply -f wechatrobot.yaml


# alertmanager 使用方式参考
# 
#      webhook_configs:
#      - url: http://prometheus-webhook-dingtalk/dingtalk/webhook2/send
#        send_resolved: true
#      - url: http://wechatrobot/webhook?key=b69dc161-0025-4ddf-b73a-cdc04b876735
#        send_resolved: true
#      - url: http://wechatrobot/webhook?key=06cb7cd7-b61d-42ed-b1bf-4894c105ea9f
#        send_resolved: true



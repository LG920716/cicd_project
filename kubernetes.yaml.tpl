apiVersion: apps/v1
kind: Deployment
metadata:
  name: cicd-project
  labels:
    app: cicd-project
spec:
  replicas: 1
  selector:
    matchLabels:
      app: cicd-project
  template:
    metadata:
      labels:
        app: cicd-project
    spec:
      containers:
      - name: cicd-project
        image: us-central1-docker.pkg.dev/GOOGLE_CLOUD_PROJECT/my-repository/cicd-project:COMMIT_SHA
        ports:
        - containerPort: 8080
---
kind: Service
apiVersion: v1
metadata:
  name: cicd-project
spec:
  selector:
    app: cicd-project
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
  type: LoadBalancer

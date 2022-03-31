resource "helm_release" "nginx" {
  name       = "nginx"
  repository = "https://frealmyr.github.io/homelab"
  chart      = "app"

  namespace        = "default"
  create_namespace = false

  values = [<<EOF
    replicaCount: 10
    image:
      repository: nginxdemos/hello
      tag: latest
    containerPorts:
      - name: http
        containerPort: 80
        protocol: TCP
    services:
      - name: http
        type: ClusterIP
        ports:
          - name: http
            port: 8080
            targetPort: 80
  EOF
  ]
}

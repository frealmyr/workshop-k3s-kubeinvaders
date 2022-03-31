resource "helm_release" "kubeinvaders" {
  name       = "kubeinvaders"
  repository = "https://lucky-sideburn.github.io/helm-charts"
  chart      = "kubeinvaders"

  namespace        = "kubeinvaders"
  create_namespace = true

  values = [<<EOF
    route_host: "192.168.0.109"
    image:
      repository: frealmyr/workshop-kubeinvaders
      tag: latest
    service:
      type: ClusterIP
      port: 8080
    ingress:
      enabled: false
    extraEnv:
     - name: ALIENPROXIMITY
       value: "10"
     - name: HITSLIMIT
       value: "0.1"
     - name: UPDATETIME
       value: "0.1"
  EOF
  ]
}

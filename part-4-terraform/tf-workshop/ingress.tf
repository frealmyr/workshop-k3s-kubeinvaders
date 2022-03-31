resource "helm_release" "kubeinvaders_ingress" {
  name       = "workshop-ingress"
  repository = "https://charts.itscontained.io"
  chart      = "raw"
  version    = "0.2.5"
  values = [
    <<-EOF
    resources:
      - apiVersion: networking.k8s.io/v1
        kind: Ingress
        metadata:
          name: kubeinvaders
          namespace: kubeinvaders
          annotations:
            kubernetes.io/ingress.class: traefik
            traefik.ingress.kubernetes.io/frontend-entry-points: "http,https"
        spec:
          tls:
            - secretName: kubeinvaders
          rules:
            - http:
                paths:
                - path: /
                  pathType: Prefix
                  backend:
                    service:
                      name: kubeinvaders
                      port:
                        number: 8080
    EOF
  ]
}

resource "helm_release" "nginx_ingress" {
name       = "nginx-ingress"
repository = "https://charts.itscontained.io"
chart      = "raw"
version    = "0.2.5"
values = [
<<-EOF
    resources:
      - apiVersion: networking.k8s.io/v1
        kind: Ingress
        metadata:
          name: nginx
          namespace: default
          annotations:
            kubernetes.io/ingress.class: traefik
            traefik.ingress.kubernetes.io/frontend-entry-points: "http,https"
        spec:
          tls:
            - secretName: nginx
          rules:
            - http:
                paths:
                - path: /nginx
                  pathType: Prefix
                  backend:
                    service:
                      name: nginx-app-http
                      port:
                        number: 8080
    EOF
]
}

# Visualizing how k8s reacts to chaos engineering

## Task 1

You can now open up a browser and visit the following sites, replacing the IP with your master node ip address

- https://10.1.1.42 (KubeInvaders)
- https://10.1.1.42/nginx (Nginx info page)

KubeInvaders shows the running pods in the `default` namespace, shooting a invader will kill a pod. 
Due to the requested amount of replicas we have set on our nginx deployment, kubernetes will spin up new pods to meet the requested amount of replicas.

The https://10.1.1.42/nginx subdirectory site is terminated by Traefik and routed to a kubernetes service, which will load-balance traffic to the requested pods.

## Task 2

You can now play around with the `replicaCount: 10` parameter in part 4 under `tf-workshop/example-apps.tf`, decrease the number of replicas and run turn on KubeInvaders while watching the `/nginx` sub-site. Will the subdirectory page go down?

What if you jank out the power of a worker node? What will happen then? (Watch KubeInvaders at the same time ofc)

If you want to inspect with kubectl at the same time, you can run the following to watch for changes every second:

```bash
watch -n 1 kubectl get pods
```

# Fetch kubeconfig

Now that we have a running K3s cluster, we need to get the `kubeconfig` so that we can run `kubectl` on the control plane.

## Task 1

The `kubeconfig` file is stored only on the master host, so we need to pull if from that rPi.

Using unix you can run the following commands:
```bash
mkdir ~/.kube
scp pi@192.168.0.109:/etc/rancher/k3s/k3s.yaml ~/.kube/config
```

On other OS you need to somehow fetch the `/etc/rancher/k3s/k3s.yaml` file and store it in `.kube/config` in your home folder. :)

## Task 2

You need to install `kubectl` on your developer machine.

When this is installed you can run this to view all running resources for all namespaces in K3s:

```bash
kubectl get all -A
```

If you get a bunch of resources, great!
Here you can also see your LoadBalancers, which is where Traefik will route incoming traefik to the rPis.

You can now move on to part 4 of the workshop, which is running Terraform.

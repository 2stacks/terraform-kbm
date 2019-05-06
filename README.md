# Kubernetes on Bare Metal with Terraform
Used to quickly provision a single node cluster in a libvirt environment

Adapted from - https://blog.alexellis.io/kubernetes-in-10-minutes/

Additional details can be found here:

- https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/
- https://github.com/kubernetes/dashboard

### Prereqs
Before you begin you must first install Terraform and the terraform-provider-libvirt

- https://www.terraform.io/downloads.html
- https://github.com/dmacvicar/terraform-provider-libvirt#installing


### Setup
Clone Repository
```bash
git clone https://github.com/2stacks/terraform-kbm.git
cd terraform-kbm
```

Create secrets variable file and add your SSH public key
```bash
cp secret.auto.tfvars.example secret.auto.tfvars
```

Deploy libvirt guest with Terraform
```bash
terraform init
terraform plan
terraform apply
```

When Terrafrom finishes it will output the libvirt guest IP

Example:
```bash
Outputs:

ip = [
    [
        192.168.122.139,
        fe80::5054:ff:fec2:43bd
    ]
]
```

Log in to the newly created guest to verify the installation and to retrieve the dashboard token.

`ssh 192.168.122.139`

```bash
kubectl get all --namespace=kube-system
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
```
Copy the admin-user token then start the kube-proxy
```bash
kubectl proxy
```

From a seperate terminal window set up an ssh tunnel to the guest IP
```bash
ssh -L 8001:127.0.0.1:8001 -N 192.168.122.139
```

Access the following URL from your local machine's browser and log in with copied admin-user token

- <http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/>
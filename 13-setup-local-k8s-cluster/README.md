# Setup local kubernetes cluster

## Task

Task: Use any sort of provider k3d, kind, minikube. Some providers deploy traefik loadbalancer by default. If not provided, deploy one yourself.

## Cheatsheet

<details>
<summary></summary>

<img name="cheatsheet" src="/resources/k8s_cheatsheet.webp">
</details>

## Solution

Install k3d using Homebrew:
```bash
$ brew install k3d
```

Create k3d cluster and verify:
```bash
$ k3d cluster create new-cluster

$ k3d cluster list
NAME          SERVERS   AGENTS   LOADBALANCER
new-cluster   1/1       0/0      true

$ kubectl get nodes
NAME                       STATUS   ROLES                  AGE   VERSION
k3d-new-cluster-server-0   Ready    control-plane,master   63s   v1.27.4+k3s1
```

The task requires the deployment of the Traefik load balancer, which is initially deployed within the k3d cluster by default. List the services to see if there's a Traefik service running:

```bash
$ kubectl get svc --all-namespaces
NAMESPACE     NAME             TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)                      AGE
default       kubernetes       ClusterIP      10.43.0.1       <none>        443/TCP                      6m57s
kube-system   kube-dns         ClusterIP      10.43.0.10      <none>        53/UDP,53/TCP,9153/TCP       6m55s
kube-system   metrics-server   ClusterIP      10.43.143.110   <none>        443/TCP                      6m53s
kube-system   traefik          LoadBalancer   10.43.77.155    172.24.0.3    80:31156/TCP,443:32163/TCP   4m33s
```

Explore different kubectl commands for a deeper understanding of its capabilities.

## Kubernetes 

<p align="center">
    <img width="600" name="k8s logo" src="/resources/k8s_logo.png">
</p>

Kubernetes (K8s) is an open-source system for automating deployment, scaling, and management of containerized applications. With the widespread adoption of containers among organizations, Kubernetes, the container-centric management software, has become the de facto standard to deploy and operate containerized applications. 
Originating from Google Cloud in 2014 and now nurtured by the Cloud Native Computing Foundation (CNCF), Kubernetes acts as the traffic controller for your containerized applications, orchestrating containerized applications to operate seamlessly. It ensures they run harmoniously, scaling up when needed and self-healing when the unexpected occurs.

The benefits of Kubernetes:
- Automated Operations: Kubernetes simplifies the complexities of day-to-day application management through built-in commands, allowing for automated operations that maintain your applications as per your specifications.
- Infrastructure Abstraction: By assuming control of compute, networking, and storage, Kubernetes liberates developers from worrying about the underlying environment, enabling a laser focus on application development.
- Service Health Monitoring: Continuously monitoring service health, Kubernetes proactively manages failing or stalled containers, guaranteeing that only properly functioning services are available to users.
- High Availability: With Kubernetes, application downtime becomes a relic of the past, ensuring uninterrupted availability for users.
Scalability and Performance: Adapting to varying loads, Kubernetes optimizes scalability, ensuring high performance aligned with the demands of user access.
- Disaster Recovery: Equipped for emergencies, Kubernetes facilitates seamless backup and restoration of data, enabling the container to resume from the latest state without data loss.
- Increased Development Velocity: Embracing cloud-native microservices and supporting containerization of existing apps, Kubernetes accelerates app development, serving as the linchpin for application modernization.
- Deploy Anywhere: Versatile by design, Kubernetes thrives in various environments, spanning on-site, public clouds, and hybrid deployments, empowering users to run applications wherever needed.
- Efficient Service Operations: Through automated cluster sizing, Kubernetes optimizes resource allocation, dynamically scaling applications to meet demand, thus ensuring efficient operations.

## Kubernetes vs. Docker

Often misunderstood as a choice between one or the other, Kubernetes and Docker are different yet complementary technologies for running containerized applications. Docker lets you put everything you need to run your application into a box that can be stored and opened when and where it is required. Once you start boxing up your applications, you need a way to manage them and that's what Kubernetes does. Kubernetes is a Greek word meaning ‘captain’ in English. Like the captain is responsible for the safe journey of the ship in the seas, Kubernetes is responsible for carrying and delivering those boxes safely to locations where they can be used. Kubernetes can be used with or without Docker.

## Kubernetes Architecture

<p align="center">
    <img width="" name="k8s architecture" src="/resources/k8s_architecture.png">
</p>

- `Pod` is the basic component or the smallest deployable unit of Kubernetes. Pod is an abstraction over a container that simplifies container management within Kubernetes, without direct work with Docker or another used container technology. It encapsulates one or more containers, allowing them to share resources and network connections. Pod is usually meant to run one application container inside of it, but it can run multiple containers inside one Pod which is usually the case if you have one main application container and a helper container or some side service that has to run inside of that Pod. To ensure high availability and load balancing, Pod Replicas create multiple instances of a pod within a Kubernetes cluster. Pods communicate via a virtual network, each having its own IP Address.
- `Worker Node` or `Node` is the fundamental unit of Kubernetes. It represents a physical or virtual machine that provides CPU and RAM resources. Nodes serve as the hosting environment for pods.
- `Control Plane` or `Master nodes` are the collection of processes responsible for controlling the cluster's state, as well as managing the worker nodes. Master nodes handle essential Kubernetes processes. They are responsible for deciding where new application Pods or database Pods should be scheduled, monitoring and managing the lifecycle of Pods, and incorporating new servers into the cluster.
- `Cluster` is a combination of nodes and is made out of atleast one node. It consists of master nodes (control plane) managing worker nodes (or simply nodes). Clusters pool resources like a hivemind, ensuring application stability even if one node encounters issues.

## k3d

`K3s` is a lightweight, easy to install, deploy, and manage version of stock Kubernetes (K8s). Although K3s is a refined version of Kubernetes (the upstream version), it does not change how Kubernetes works at its core.

`k3d` is a lightweight wrapper to run k3s (Rancher Lab’s minimal Kubernetes distribution) in docker and makes it very easy to create single- and multi-node k3s clusters in docker, e.g. for local development on Kubernetes. It is a community-driven project but it’s not an official Rancher (SUSE) product.

## Load balancer

<p align="center">
    <img width="" name="load balancer" src="/resources/load_balancer.webp">
</p>

Modern high‑traffic websites must serve hundreds of thousands, if not millions, of concurrent requests from users or clients and return the correct text, images, video, or application data, all in a fast and reliable manner. To cost‑effectively scale to meet these high volumes, modern computing best practice generally requires adding more servers.

A load balancer acts as the “traffic cop” sitting in front of your servers and routing client requests across all servers capable of fulfilling those requests in a manner that maximizes speed and capacity utilization and ensures that no one server is overworked, which could degrade performance. If a single server goes down, the load balancer redirects traffic to the remaining online servers. When a new server is added to the server group, the load balancer automatically starts to send requests to it.

In this manner, a load balancer performs the following functions:
- Distributes client requests or network load efficiently across multiple servers
- Ensures high availability and reliability by sending requests only to servers that are online
- Provides the flexibility to add or subtract servers as demand dictates

Different load balancing algorithms provide different benefits; the choice of load balancing method depends on your needs. Some of the algorithms are: Round Robin, Least Connections, Least Time, Hash, IP Hash, Random with Two Choices.

## Traefik

<p align="center">
    <img width="600" name="traefik" src="/resources/traefik_logo.png">
</p>

Traefik is a leading modern reverse proxy and load balancer that makes deploying microservices easy. Traefik integrates with your existing infrastructure components and configures itself automatically and dynamically.

Traefik is designed to be as simple as possible to operate, but capable of handling large, highly-complex deployments across a wide range of environments and protocols in public, private, and hybrid clouds. It also comes with a powerful set of middlewares that enhance its capabilities to include load balancing, API gateway, orchestrator ingress, as well as east-west service communication and more.
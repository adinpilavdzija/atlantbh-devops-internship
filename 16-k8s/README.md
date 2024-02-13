# Migrate docker-compose deployment to kubernetes

## Task

Task: 

Migrate docker-compose deployment to kubernetes:
- Write deployment/statefulset manifests <!-- -> 🔴 -->
- Expose applications (use localhost domain and subdomains) <!-- -> 🔴 -->

<!-- https://medium.com/international-school-of-ai-data-science/kubernetes-101-a-beginners-guide-to-container-management-a7937106b73 🔴 -->

## Main components

Kubernetes offers out of the box a virtual Network, which means that each Pod (not the container) gets its own IP address and each Pod can communicate with each other using that IP address (it's an internal IP address, not the public one).

Three processes that must be installed on every **Worker node** that are used to schedule and manage those parts:
- `kubelet`: agent that runs on each worker node and is responsible for ensuring that containers are running in a Pod. It communicates with the master node to receive instructions and report the status of the node. Additionally, it manages the allocation of resources from the node to the container, including CPU, RAM, and storage resources.
- `kube-proxy`: critical process responsible for routing requests from Services to Pods. It maintains network rules on nodes. It incorporates sophisticated forwarding logic to ensure efficient communication with minimal overhead. For example, if an instance of "my app" needs to access a database, instead of blindly directing the request to any available replica, kube-proxy intelligently routes it to the replica operating on the same node as the initiating Pod.
- `container runtime`: software responsible for running containers. Application Pods have containers running inside, so a container runtime needs to be installed on every node. Kubernetes supports multiple container runtimes, such as Docker, containerd, and others.

Four essential processes run on each **Master node** to handle these crucial functionalities:
- `kube-apiserver`: component that exposes the Kubernetes API. It is the front-end for the Kubernetes control plane, the primary gateway for user requests and updates. All operations (deployments, services, etc.) are carried out by communicating with the API server. It's also responsible for authentication, ensuring that only authenticated and authorized requests access the cluster. By serving as the single entry point, it enhances security and validates requests before forwarding them to other processes.
- `etcd`: functions as the cluster's brain, storing vital configuration data of the cluster (key-value) that orchestrates the communication between master and worker nodes. It captures changes in the cluster's state, such as Pod scheduling or failures, enabling all processes to access consistent and updated information. However, it doesn't store the application data itself, such as a database's content.
- `kube-controller-manager`: monitors the cluster's state and responsible for regulating the state of various components in the system. When Pods crash or experience state changes, it promptly detects these occurrences and initiates actions to restore the desired state. It communicates with the scheduler to reassign and restart Pods on appropriate nodes via the respective kubelets. Examples include node controllers, replication controllers, and endpoint controllers.
- `kube-scheduler`: responsible for distributing workloads or containers across multiple nodes in the cluster. It decides which node should run a particular pod based on resource availability and other constraints. However, the actual execution of this decision falls to the kubelet, which initiates and manages the assigned Pod on the selected node.

**Master nodes** handle essential Kubernetes processes and they are critical, while **worker nodes** handle heavier workloads. In practice, a Kubernetes cluster is usually made up of multiple Master nodes where each runs its Master processes. These Master nodes operate independently, with the API server load balanced across them for enhanced reliability. Additionally, the etcd distributed storage system spans across all Master nodes, ensuring that vital cluster state information is consistently maintained and accessible across the entire cluster. This distributed architecture not only improves fault tolerance but also supports scalability and resilience in managing the cluster's operations effectively.

- `ReplicaSet`: responsible to maintain a stable set of replica Pods running at any given time. As such, it is often used to guarantee the availability of a specified number of identical Pods.
- `Deployment`: provides declarative updates for Pods and ReplicaSets. You describe a desired state in a Deployment, and the Deployment Controller changes the actual state to the desired state at a controlled rate. You can define Deployments to create new ReplicaSets, or to remove existing Deployments and adopt all their resources with new Deployments. It handles scaling and replication for stateless applications.
- `StatefulSet`: workload API object used to manage stateful applications. Manages the deployment and scaling of a set of Pods, and provides guarantees about the ordering and uniqueness of these Pods. Like a Deployment, a StatefulSet manages Pods that are based on an identical container spec. Unlike a Deployment, a StatefulSet maintains a sticky identity for each of its Pods. These pods are created from the same spec, but are not interchangeable: each has a persistent identifier that it maintains across any rescheduling. Specifically for stateful applications like databases. Manages replicas requiring shared data storage and ensures consistency in read/write operations. Needed for applications with state (e.g., MySQL, MongoDB).

While Deployments handle replicas for stateless apps, StatefulSets are vital for maintaining consistency in stateful applications by managing shared data access among replicas. Databases or stateful apps are best managed by StatefulSets due to their need for shared data storage and consistent read/write operations. However, hosting databases outside Kubernetes is common due to the complexity of managing StatefulSets and communication with external databases for efficiency in production scenarios.

Pod components in Kubernetes are ephemeral which means that they can die very easily and when that happens a new Pod will get created in its place, but it will get assigned a new IP address which is inconvenient because you have to adjust communication every time Pod restarts. 

- `Services`: provide a permanent/static IP address for pods, ensuring continuity even when pods are replaced. For external access, an external service allows browser access but might have an impractical URL, containing node IP addresses and port numbers. Kubernetes introduces Ingress to address this issue, enabling secure protocols and domain names for user-friendly access. Requests first go through Ingress for forwarding to the appropriate service. Life cycles of Service and the Pod are not connected so even if the Pod dies the Service and its IP address will stay.

Types of **Services**:
- `Internal`:
    - `ClusterIP`: default service. It exposes the service on a cluster-internal IP address. This service type is accessible only within the cluster.
- `External`:
    - `NodePort`: exposes the service on each node's IP at a static port. This makes the service accessible from outside the cluster, using the <NodeIP>:<NodePort> combination.
    - `LoadBalancer`: exposes the service externally using a cloud provider's load balancer. The cloud provider assigns an external IP that forwards traffic to the service.
    - `ExternalName`: provides a way to use a service that exists outside the cluster. This service type redirects to an external DNS name.

For your application to be accessible through a browser, you would have to create an External Service. External Services is a service that opens the communication from external sources. You wouldn't want your database to be open to the public requests and for that you would create Internal Service which is a type of a service that you specify when creating one.

The URL of the External Service is not particularly practical, because it comprises of HTTP protocol linked with a node's IP address and the port number, which is not suitable for the end product. You'd prefer your URL to have a secure protocol and a domain name, which can be achieved with another component known as Ingress. So instead of Service, the request goes first to Ingress and it does the forwarding then to the Service.

- `Ingress`: API object that provides HTTP and HTTPS routing to services based on rules defined by the user. It acts as a application load balancer (layer 7 of OSI) and allows external traffic to reach services within the cluster. Ingress provides a way to define how external HTTP/S traffic should be processed and directed to different services.
- `ConfigMap`: stores non-sensitive configuration data as key-value pairs that can be used by pods during runtime. It provides a way to decouple configuration artifacts from container images. Used for environment variables or file mounting.
- `Secret`: similar to ConfigMap but stores sensitive information like passwords, certificates, API keys and tokens. Base64-encoded, usable as environment variables or mounted files.
- `Volumes`: directory that is accessible to containers in a pod. It allows data to persist beyond the lifetime of a container and can be shared among containers in the same pod.
- `Namespace`: way to create a logically isolated cluster within a Kubernetes cluster. It allows multiple teams or projects to share the same physical cluster while maintaining separation.

## Port-forward

`port-forward` command is used to forward one or more local ports to a pod. It allows you to access resources inside your Kubernetes cluster as if they were running on your local machine.

```bash
$ kubectl port-forward service/auction-backend 8080:8080
Forwarding from 127.0.0.1:8080 -> 8080
Forwarding from [::1]:8080 -> 8080
Handling connection for 8080
Handling connection for 8080
Handling connection for 8080
...

$ kubectl port-forward service/auction-frontend 5173:5173
Forwarding from 127.0.0.1:5173 -> 80
Forwarding from [::1]:5173 -> 80
Handling connection for 5173
Handling connection for 5173
Handling connection for 5173
...
```
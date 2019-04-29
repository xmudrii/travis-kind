## Simple target running a kubectl command to ensure the cluster is up and running
## Environment variables are not always recognized by Makefiles, so it's recommended to use the --kubeconfig flag
test-integration:
	kubectl --kubeconfig="$(kind get kubeconfig-path)" get nodes && kubectl --kubeconfig="$(kind get kubeconfig-path)" get pods --all-namespaces -o wide

test-integration: ## Simple target running a kubectl command to ensure the cluster is up and running
	kubectl --kubeconfig=$(kind get kubeconfig-path) get nodes && kubectl --kubeconfig=$(kind get kubeconfig-path) get pods --all-namespaces -o wide

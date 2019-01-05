test-integration: ## Simple target running a kubectl command to ensure the cluster is up and running
	kubectl get pods --all-namespaces -o wide

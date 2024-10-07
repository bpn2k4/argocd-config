# Create ssh key pair
ssh-keygen -t rsa -b 4096 -C "argocd" -f argocd.key -q -N ""
mv argocd.key.pub argocd.pub

# Create a project
argocd proj create test -d *,* -s * --allow-cluster-resource */*

# Add repository
argocd repo add git@github.com:bpn2k4/argocd-config.git --project test --ssh-private-key-path argocd.key
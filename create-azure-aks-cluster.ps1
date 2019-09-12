az aks create `
    --resource-group AFC-Dev `
    --name afcdevaks `
    --node-count 1 `
    --service-principal <insert svc principal guid> `
    --client-secret <insert svc principal key> `
    --generate-ssh-keys
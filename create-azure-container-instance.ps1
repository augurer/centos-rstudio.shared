# docker tag centos-rstudio:v4 afcdevacr.azurecr.io/centos-rstudio:v4
# docker push afcdevacr.azurecr.io/centos-rstudio:v4
az container create `
    --resource-group afc-dev `
    --name centos-rstudio `
    --image afcdevacr.azurecr.io/centos-rstudio:v4 `
    --dns-name-label afcdevrss `
    --cpu 1 `
    --memory 4 `
    --registry-login-server afcdevacr.azurecr.io `
    --registry-username <svc principal guid> `
    --registry-password <svc principal key> `
    --azure-file-volume-account-name afcdevstgrstudio `
    --azure-file-volume-account-key <stg acct key> `
    --azure-file-volume-share-name cranrepo `
    --azure-file-volume-mount-path /dockerdata
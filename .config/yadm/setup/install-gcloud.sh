# https://docs.cloud.google.com/sdk/docs/install-sdk#linux
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
tar -xf google-cloud-cli-linux-x86_64.tar.gz && rm google-cloud-cli-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh

# prompts to login via browser link
# need to paste code into terminal
# then select cloud project
./google-cloud-sdk/bin/gcloud init

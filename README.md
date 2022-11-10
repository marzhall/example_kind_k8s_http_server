# An example of a server application written in go

This application serves the local directory where it's being run
on a webserver, so it can be grabbed over http.

It's a poor example of go modules, but it's useful for testing
if your k8s server is serving things correctly, and you can deploy
to it.

Usage:

```
# In toplevel of repo

docker build -t server:newboy .
kubectl apply -f kubes/httptest

# then check your k8s server to see if the application is being
# served on http port 80

wget <kubes_server_ip>:80

```

# Bonus Content

There's a script in `kubes/scripts` that can be used to spin up a kind
kubernetes server and run the application. It assumes kubectl is installed.
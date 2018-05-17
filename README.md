# socat on OpenShift

This is a very small docker image that allows to run socat on OpenShift without root. It's mainly intended to
do port-forwarding to locations outside of the OpenShift cluster. E.g. you could use this to reach machines
on an internal network that is not accessible directly from your machine but can be accessed through the
OpenShift cluster.

## Usage

```bash
oc new-app derkork/socat-openshift --name=<a name of your choice> \
    -e TARGET_HOST=<target host> -e TARGET_PORT=<target port>
```

Then you can use `oc port-forward` locally to connect to your internal machine:

```bash
oc port-forward <pod name> 8888:8888
```

And now you can access your service on port `8888` from your local machine.

## Configuration

By default socat will listen on TCP port 8888 and forward all incoming connections to the target host and port.

You can override all this with these environment variables:

* `LISTEN_PROTO` - the protocol to listen on (e.g. TCP4, TCP6, etc.)
* `LISTEN_PORT` - the port to listen on
* `TARGET_PROTO` - the target protocol (e.g. TCP4, TCP6, etc..)
* `TARGET_HOST` - the host to forward data to
* `TARGET_PORT` - the port on which the host listens.



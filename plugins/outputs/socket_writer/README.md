# socket_writer Plugin

The socket_writer plugin can write to a UDP, TCP, or unix socket.

It can output data in any of the [supported output formats](https://github.com/influxdata/telegraf/blob/master/docs/DATA_FORMATS_OUTPUT.md).

```toml
# Generic socket writer capable of handling multiple socket types.
[[outputs.socket_writer]]
  ## URL to connect to
  # address = "tcp://127.0.0.1:8094"
  # address = "tcp://example.com:http"
  # address = "tcp4://127.0.0.1:8094"
  # address = "tcp6://127.0.0.1:8094"
  # address = "tcp6://[2001:db8::1]:8094"
  # address = "udp://127.0.0.1:8094"
  # address = "udp4://127.0.0.1:8094"
  # address = "udp6://127.0.0.1:8094"
  # address = "unix:///tmp/telegraf.sock"
  # address = "unixgram:///tmp/telegraf.sock"

  ## Data format to generate.
  ## Each data format has it's own unique set of configuration options, read
  ## more about them here:
  ## https://github.com/influxdata/telegraf/blob/master/docs/DATA_FORMATS_INPUT.md
  # data_format = "influx"
```
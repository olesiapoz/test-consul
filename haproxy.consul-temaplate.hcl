#consul-template -config /path/to/consul-template/file.hcl
template {
  # This is the source file on disk to use as the input template. This is often
  # called the "Consul Template template". This option is required if not using
  # the `contents` option.
  source = "/home/centos/test-consul-config-master/haproxy.ctmpl"

  # This is the destination path on disk where the source template will render.
  # If the parent directories do not exist, Consul Template will attempt to
  # create them, unless create_dest_dirs is false.
  destination = "/home/centos/test-consul-config-master/haproxy.cfg"

  # This options tells Consul Template to create the parent directories of the
  # destination path if they do not exist. The default value is true.
  create_dest_dirs = true

  # This is the optional command to run when the template is rendered. The
  # command will only run if the resulting template changes. The command must
  # return within 30s (configurable), and it must have a successful exit code.
  # Consul Template is not a replacement for a process monitor or init system.
  command = "docker restart ha-proxy-lb"

  }
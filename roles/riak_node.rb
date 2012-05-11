name "riak_node"
description "Role with a Riak node."
run_list(
  "recipe[riak]"
)
override_attributes(
  "riak" => {
    "core" => {
      "ssl" => { 
	 "certfile" => "./etc/cert.pem",
	 "keyfile" => "./etc/key.pem"
	 },
      "https" => [ [ "0.0.0.0", 8069 ] ],
      "http" => [ [ "0.0.0.0", 8098 ] ]
    },
    "kv" => {
      "pb_ip" => "0.0.0.0",
      "pb_port" => 8087,
      "storage_backend" => :riak_kv_eleveldb_backend
    },
    "search" => {
      "enabled" => true
    },
    "control" => {
      "enabled" => true
    }
  }
)

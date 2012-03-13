name "riak_node"
description "Role with a Riak node."
run_list(
  "recipe[riak]"
)
override_attributes(
  "riak" => {
    "core" => {
      "http" => [ [ "0.0.0.0", 8098 ] ]
    },
    "kv" => {
      "pb_ip" => "0.0.0.0",
      "pb_port" => 8087,
      "storage_backend" => :riak_kv_eleveldb_backend
    },
    "control" => {
      "enabled" => true
    }
  }
)

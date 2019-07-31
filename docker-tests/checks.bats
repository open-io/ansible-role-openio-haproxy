#! /usr/bin/env bats

# Variable SUT_ID should be set outside this script and should contain the ID
# number of the System Under Test.

# Tests
@test 'Config is valid' {
  run bash -c "docker exec -ti ${SUT_ID} haproxy -c -f /etc/haproxy/haproxy.cfg"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" =~ "Configuration file is valid" ]]
}

@test 'Backends server are present' {
  run bash -c "docker exec -ti ${SUT_ID} cat /etc/haproxy/haproxy.cfg"
  echo "output: "$output
  echo "status: "$status
  [[ "${output}" =~ "server swift-proxy1 172.17.0.2:6007 check inter 5s" ]]
  [[ "${output}" =~ "server keystone-admin1 172.17.0.2:35357 check inter 5s" ]]
  [[ "${output}" =~ "server keystone-public1 172.17.0.2:5000 check inter 5s" ]]
  [[ "${output}" =~ "server conscience1 172.17.0.2:6000 check inter 5s" ]]
}

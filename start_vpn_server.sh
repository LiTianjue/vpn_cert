#!/bin/bash

root_dir=.
cert_type=rsa
openvpn_exe=./openvpn


ca_cert=${root_dir}/cert/${cert_type}/ca.crt
ca_key=${root_dir}/cert/${cert_type}/ca.key

server_cert=${root_dir}/cert/${cert_type}/server.crt
server_key=${root_dir}/cert/${cert_type}/server.key

client_cert=${root_dir}/cert/${cert_type}/client.crt
client_key=${root_dir}/cert/${cert_type}/client.key


dh_key=${root_dir}/cert/rsa/dh2048.pem


client_config=${root_dir}/config/client.conf
server_config=${root_dir}/config/server.conf

${openvpn_exe} --config ${server_config} \
	--ca ${ca_cert} \
	--cert ${server_cert} \
	--key  ${server_key} \
	--dh	${dh_key}


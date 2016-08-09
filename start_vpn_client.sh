#!/bin/bash

root_dir=.
cert_type=sm2
openvpn_exe=./openvpn


ca_cert=${root_dir}/cert/${cert_type}/ca.crt
ca_key=${root_dir}/cert/${cert_type}/ca.key

server_cert=${root_dir}/cert/${cert_type}/server.crt
server_key=${root_dir}/cert/${cert_type}/server.key

client_cert=${root_dir}/cert/${cert_type}/client.crt
client_key=${root_dir}/cert/${cert_type}/client.key

client_enc_cert=${root_dir}/cert/${cert_type}/client_enc.crt
client_enc_key=${root_dir}/cert/${cert_type}/client_enc.key

dh_key=${root_dir}/cert/rsa/dh2048.pem


client_config=${root_dir}/config/client.conf

${openvpn_exe} --config ${client_config} \
	--ca ${ca_cert} \
	--cert ${client_cert} \
	--key  ${client_key} \
	--enc-key ${client_enc_key} \
	--extra-certs ${server_enc_cert}


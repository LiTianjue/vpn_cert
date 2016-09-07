#!/bin/bash

root_dir=.
cert_type=sm2
openvpn_exe=./openvpn


ca_cert=${root_dir}/cert/${cert_type}/ca.crt
ca_key=${root_dir}/cert/${cert_type}/ca.key

server_cert=${root_dir}/cert/${cert_type}/server.crt
server_key=${root_dir}/cert/${cert_type}/server.key

server_pfx=${root_dir}/cert/${cert_type}/server.pfx

server_enc_cert=${root_dir}/cert/${cert_type}/server_enc.crt
server_enc_key=${root_dir}/cert/${cert_type}/server_enc.key

client_cert=${root_dir}/cert/${cert_type}/client.crt
client_key=${root_dir}/cert/${cert_type}/client.key


dh_key=${root_dir}/cert/rsa/dh2048.pem


client_config=${root_dir}/config/client.conf
server_config=${root_dir}/config/server.conf

${openvpn_exe} --config ${server_config} \
	--ca ${ca_cert} \
	--pkcs12 ${server_pfx} \
	--dh	${dh_key}	\
	--enc-key ${server_enc_key}	\
	--extra-certs ${server_enc_cert}


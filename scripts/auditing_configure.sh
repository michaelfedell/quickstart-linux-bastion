#!/bin/bash
function install_stuff_ubuntu(){
  apt-get -y install auditd
}

function add_the_rules(){
  cat /tmp/auditd.rules >> /etc/audit/rules.d/audit.rules
  rm /tmp/auditd.rules
}

function restart_services(){
  service auditd restart
}

case "${BASTION_OS}" in 
    "Ubuntu")
      install_stuff_ubuntu
      ;;
esac

add_the_rules
restart_services

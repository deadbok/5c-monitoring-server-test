#!/bin/sh

vagrant up && ansible-playbook -i inventory/hosts playbook.yml

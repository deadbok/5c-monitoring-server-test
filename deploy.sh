#!/bin/sh

vagrant up && ansible-playbook -vv -i inventory/hosts playbook.yml

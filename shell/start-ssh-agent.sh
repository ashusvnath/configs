#!/bin/bash

[ -f "${HOME}/.ssh-agent-details" ] && source "${HOME}/.ssh-agent-details" > /dev/null

[ `pidof ssh-agent | grep ${SSH_AGENT_PID} | wc -l` -eq 0 ] && ssh-agent > "${HOME}/.ssh-agent-details"

source "${HOME}/.ssh-agent-details" > /dev/null

[ `ssh-add -L | grep "The agent has no identities" | wc -l` -eq 1 ] && ssh-add

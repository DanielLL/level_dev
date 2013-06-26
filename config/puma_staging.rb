#!/usr/bin/env puma

environment 'staging'
daemonize
pidfile '/home/leveldev/leveldev/tmp/pids/puma.pid'
state_path '/home/leveldev/leveldev/tmp/pids/puma.state'
stdout_redirect '/home/leveldev/leveldev/log/stdout', '/home/leveldev/leveldev/log/stderr', true
bind 'tcp://0.0.0.0:5040'

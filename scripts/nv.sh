#!/bin/bash

# load variables

. ./remote_config.sh

ssh -t -p $PORT $USER@$IP 'nvim'

#!/bin/bash

# load variables

. ./remote_config.sh

ssh -p $PORT $USER@$IP

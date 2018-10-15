#!/bin/sh
aws kms decrypt --ciphertext-blob fileb://username.enc --output text --query Plaintext | base64 -D

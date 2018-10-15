# Encrypting

```
aws kms encrypt --key-id 0eb289db-1454-402c-b17b-ea2c58524196 --plaintext fileb://username --query CiphertextBlob --output text | base64 -D > username.enc
```
# Decrypting

```
DECRYPTED=`aws kms decrypt --ciphertext-blob fileb://username.enc --output text --query Plaintext | base64 -D`
```

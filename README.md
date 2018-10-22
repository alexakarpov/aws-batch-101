# aws-batch-101
AWS Batch 101

There's a guide that explains everything that this repo contains, you can check it out here: https://stackify.com/aws-batch-guide/


## KMS shenanigans
```
2018-10-14 20:13:40 ⌚  akamac in ~/.aws
○ → aws --profile bob kms encrypt --key-id 0eb289db-1454-402c-b17b-ea2c58524196 --plaintext "qwerty asdfgh zxcvbn" --output text | base64 -D  > encrypted.txt

2018-10-14 21:22:36 ⌚  akamac in ~/.aws
○ → aws --profile bob kms decrypt --ciphertext-blob fileb://encrypted.txt --query Plaintext --output text | base64 -D
qwerty asdfgh zxcvbn
```


###also check this out
https://aws.amazon.com/blogs/compute/managing-secrets-for-amazon-ecs-applications-using-parameter-store-and-iam-roles-for-tasks/

# Agora Ansible Repository

## Preparatory steps

- Configure ansible variables in files/vars.yml
- Add files/saml-encrypt.crt and files/saml-encrypt.key
- Add files/saml-sign.crt and files/saml-sign.key
- Add files/server.crt and files/server.key
- Add inventory

## Run playbook

```
ansible-playbook -i inventory playbook.yml
```

Enjoy...

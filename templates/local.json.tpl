{
  "mongo_server": "{{ mongo_server }}",
  "mongo_options": {
    "db": { "native_parser": true},
    "user" : "{{ mongo_user }}",
    "pass" : "{{ mongo_pass }}"
  },
  "mongo_db": "{{ mongo_db }}",
  "ssl_options": {
  	"ssl_key": "ssl/server.key",
  	"ssl_cert": "ssl/server.crt",
  	"secureProtocol": "TLSv1_method"
  },
  "passport": {
    "saml": {
      "path": "/api/login/saml/callback",
      "protocol": "https",
      "entryPoint": "https://openidp.feide.no/simplesaml/saml2/idp/SSOService.php",
      "issuer": "{{ agora_base_url }}/saml2/entityid",
      "callbackUrl": "{{ agora_base_url }}/api/login/saml/callback",
      "identifierFormat": "urn:oasis:names:tc:SAML:2.0:nameid-format:transient",
      "serviceName": "{{ agora_service_name }}",
      "serviceDescription": "{{ agora_service_description }}",
      "decryptionCertName": "ssl/saml-encrypt.crt",
      "decryptionPvkName": "ssl/saml-encrypt.key",
      "publicCertName": "ssl/saml-sign.crt",
      "privateCertName": "ssl/saml-sign.key",
      "disableRequestedAuthnContext": {{ agora_requested_authn_context }},
      "requestedAttributes":[
        {
          "FriendlyName": "eduPersonTargetedID",
          "Name": "urn:oid:1.3.6.1.4.1.5923.1.1.1.10",
          "NameFormat": "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          "isRequired": "true"
        },
        {
          "FriendlyName": "eduPersonPrincipalName",
          "Name": "urn:oid:1.3.6.1.4.1.5923.1.1.1.6",
          "NameFormat": "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          "isRequired": "true"
        },
        {
          "FriendlyName": "mail",
          "Name": "urn:oid:0.9.2342.19200300.100.1.3",
          "NameFormat": "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          "isRequired": "false"
        },
        {
          "FriendlyName": "cn",
          "Name": "urn:oid:2.5.4.3",
          "NameFormat": "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          "isRequired": "false"
        },
        {
          "FriendlyName": "displayName",
          "Name": "urn:oid:2.16.840.1.113730.3.1.241",
          "NameFormat": "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          "isRequired": "false"
        },
        {
          "FriendlyName": "givenName",
          "Name": "urn:oid:2.5.4.42",
          "NameFormat": "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          "isRequired": "false"
        },
        {
          "FriendlyName": "surname",
          "Name": "urn:oid:2.5.4.4",
          "NameFormat": "urn:oasis:names:tc:SAML:2.0:attrname-format:uri",
          "isRequired": "false"
        }
      ]
    }
  },
  "nodejs_port": {{ agora_port }}
}

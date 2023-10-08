# !/bin/sh

set -e

mkdir -p /etc/nginx/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $CERTS_KEY -out $CERTS_ -subj "/C=MO/L=BG/O=1337/CN=adouib.1337.ma" #fields, COUNTRY, LOCATION, ORGANIZATION, COMMON NAME OR DOMAIN NAME

# req: This command is used for certificate requests and related operations.
# -x509: This option specifies that a self-signed certificate should be generated instead of a certificate signing request (CSR).
# -nodes: This option specifies that the private key should not be encrypted with a passphrase.
# -days 365: This option sets the validity period of the certificate to 365 days.
# -newkey rsa:2048: This option generates a new RSA private key with a key length of 2048 bits.

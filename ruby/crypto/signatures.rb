#
# Notes about generating signatures in ruby
#

require "openssl"

# Generate an HMAC SHA256 hex signature
signature = OpenSSL::HMAC.hexdigest(
  "SHA256",
  "mykey1234",
  "{\"some_json\": \"payload\"}"
)

puts signature
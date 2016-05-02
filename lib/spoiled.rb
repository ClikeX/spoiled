require 'socket'
require 'openssl'

require "active_support/all"

require "spoiled/version"

module Spoiled
  def self.verify url, port = 443
    tcp_client = TCPSocket.new(url, 443)
    ssl_client = OpenSSL::SSL::SSLSocket.new(tcp_client)
    ssl_client.connect
    cert = OpenSSL::X509::Certificate.new(ssl_client.peer_cert)
    ssl_client.sysclose
    tcp_client.close

    certprops = OpenSSL::X509::Name.new(cert.issuer).to_a
    issuer = certprops.select { |name, data, type| name == "O" }.first[1]

    cn = cert.subject.to_s.gsub!(/.*?(?=CN=)/im, "").gsub("CN=", '')

    result = {
      url: url,
      port: port,
      valid_on: cert.not_before.to_date,
      valid_until: cert.not_after.to_date,
      issuer: issuer,
      time_remaining: ( cert.not_after.to_date - Date.today ).to_i.days,
      common_name: cn
    }
  end
end

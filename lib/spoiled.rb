require "active_support/all"

require "spoiled/version"

module Spoiled
  def self.verify url, port = 443
    command = "echo | openssl s_client -connect #{url}:#{port} 2>/dev/null | openssl x509 -noout -dates"
    output = `#{command}`

    not_before = output.lines.first.to_date
    not_after = output.lines.last.to_date
    time_remaining = ( not_after - Date.today ).to_i.days

    {
      not_before: not_before,
      not_after: not_after,
      time_remaining: time_remaining
    }
  end
end

require 'uri'

class UrlParser
  attr_accessor :url, :scheme, :domain, :port, :path, :query_string, :fragment_id
  def initialize(url)
    @url = URI::parse(url)
    @scheme = @url.scheme
    @domain = @url.host
    @port = @url.port.to_s
    @path = @url.path.gsub('/', '') unless @url.path == "/"
    @query_string = Hash[@url.query.tr("&=", " ").split(" ").each_slice(2).to_a] unless @url.query == nil
    @fragment_id = @url.fragment
  end
end

new_url = UrlParser.new("https://www.google.com/search")

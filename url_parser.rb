class UrlParser
  attr_reader :scheme, :domain, :path, :fragment_id
  
    def initialize(url)
        @url = url
        @fragment_id = url.split("#").last
 
    end
    
    def scheme 
        scheme_arr = @url.split(":")
        return scheme_arr[0]
    end

    def domain 
       domain_arr = @url.split("//").last.split(":").first
       return domain_arr
    end
    
     #why does the last array item have to go first while the first array item has to go last?
    
    def port 
       port_arr = @url.split(":").last.split("/").first
       return port_arr
    end
    #why does the last array item have to go first while the first array item has to go last?
    
    def path 
        path_arr = @url.split("/").last.split("?").first
        return path_arr
    end
    #why does it only work when I put '/' as last when it appears first in the url while '?' appears last?
    
    def query_string 
      if 
        query_string_arr = @url.split("?").last.split("#").first
        query_string_arr = { "q" => "cat", "name" => "Larry"}
      elsif 
        query_string_arr = @url.split("?").last.split("#").first
        query_string_arr = { "q" => "cat"}
      end
    end
  end 
    
  # http://www.google.com:60/search?q=cat&name=Larry#img=FunnyCat
  
  # context 'with no path' do
    # before(:each) do
# @new_url = UrlParser.new "https://www.google.com/?q=cat#img=FunnyCat"

# def query_string
#     query_string_arr = @url.split("?").last.split("#").first
#     query_string_arr = { "q" => "cat"}


# with a special case
#     with no port number and a http scheme should default to port 80 
#     with no port number and a https scheme should default to port 443 
# def port
#     port_arr = @url.split(":").last.split("/").first
#
#     if self.scheme == "http" and p_url.nil?
#       return "80"
#     elsif  self.scheme == "https" and p_url.nil?
#       return "443"
#     else
#       return p_url
#     end
# end
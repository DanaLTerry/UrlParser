class UrlParser
  attr_reader :scheme, :domain, :path, :fragment_id
  
    def initialize(url)
        @url = url
        @fragment_id = url.split("#").last
 #        @scheme = @url.split('/')[0].split(':')[0]
 #        @domain = @url.split('//')[2].split(':')[0]
 #        if @url.split('/')[2].include? ':'
 #          @port = @url.split('/')[2].split(':')[1]
 #        else
 #          @port = nil
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
        query_string_arr = @url.split("?").last.split("#").first
        query_string_arr = { "q" => "cat", "name" => "Larry"}
    end
    
  # http://www.google.com:60/search?q=cat&name=Larry#img=FunnyCat
    
end 
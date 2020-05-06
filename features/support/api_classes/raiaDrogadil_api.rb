class RaiaDrogadil_api
  include HTTParty
  base_uri $base_uri
  
  def get_endpoint(endpoint) 
    self.class.get(endpoint)
  end

end
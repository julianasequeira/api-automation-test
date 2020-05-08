# classe com os metodos utilizados
class RaiaDrogadil
  include HTTParty

  base_uri $base_uri

  def get_url(url)
    self.class.get(url)
  end
end

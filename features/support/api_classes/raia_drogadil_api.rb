# classe com os metodos utilizados
class RaiaDrogadil
  include HTTParty
  def get_url(url)
    self.class.get(url)
  end
end

class SearchController < ApplicationController
  def index
    @search = Search.new
  end
  def search
    @username = params[:search][:username]
    @github_url = "https://github.com/"+ @username
    # Kullanılan ubuntu dağıtımımla ilgili ssh kullanımında çıkan hata için yazılmış kod satırları mevcuttur.
    begin
      get_github_response = RestClient::Request.execute(
        :url => @github_url, 
        :method => :get, 
        :verify_ssl => false
       )
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
    # Kullanıcı bulunması dahilinde sayacı bir artırıp kaydeden kod bloğudur.
    test = Search.find_by_username(@username)
    if test 
      test.count += 1
      test.save
    else
      yeni = Search.new
      yeni.username = @username
      yeni.count = 1
      yeni.save
    end
    redirect_to @github_url unless e
  end
  # Aranan kullanıcıların listelenmesini sağlayan fonksiyondur.
  def list
    @all_list = Search.all
  end
end

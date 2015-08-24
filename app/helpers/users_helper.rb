module UsersHelper
  def location
    session[:location]
  end

  def search_client
    @search_client ||= SearchAPI.new
  end
end

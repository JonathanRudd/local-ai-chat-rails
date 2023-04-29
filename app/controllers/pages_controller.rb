class PagesController < ApplicationController
  def home
    @title = "Home"

    get '/fetch_gpt' do
      items = JSON.parse(request.body.read)
      response = GptApi.fetch_gpt(items)
      return response.to_json
    end


  end

end

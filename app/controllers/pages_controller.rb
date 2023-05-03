class PagesController < ApplicationController
  def home
    @title = "Home"

    @response = ChatgptService.call(params[:message])

  end

  # def call(items)
  #   @response = GptApi.fetch_gpt(items)
  # end



end

class Api::MockController < ApplicationController
  respond_to :json

  def index
  end

  def catch_all
    api = Api.where(uuid: params[:uuid]).first

    result = {}
    if api.nil?
      result[:api_name] = 'Not found'
    else
      result[:api_name] = api.name
    end
    respond_with result
  end
end

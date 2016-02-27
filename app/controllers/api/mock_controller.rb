class Api::MockController < ApplicationController
  respond_to :json

  def index
  end

  def catch_all
    api = Api.where(uuid: params[:uuid]).first

    event = Event.new

    result = {}
    result[:method] = request.method
    result[:body] = request.body
    event.method = request.method
    event.body = request.body.read
    event.api = api

    event.save

    env = {}
    request.env.map { |key, value| env[key] = value.to_s }
    result[:env] = env

    env.each do |name, value|
      property = Property.new
      property.name = name
      property.source = 'env'
      property.value = value
      property.event = event
      property.save
    end

    headers = {}
    request.headers.each { |key, value| headers[key] = value.to_s }
    result[:headers] = headers

    headers.each do |name, value|
      property = Property.new
      property.name = name
      property.source = 'header'
      property.value = value
      property.event = event
      property.save
    end

    result[:params] = params
    if api.nil?
      result[:api_name] = 'Not found'
    else
      result[:api_name] = api.name
    end
    respond_with result
  end
end

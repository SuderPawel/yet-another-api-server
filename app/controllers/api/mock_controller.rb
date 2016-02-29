class Api::MockController < ApplicationController
  protect_from_forgery with: :null_session

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

    headers = {}
    request.headers.each { |key, value| headers[key] = value.to_s }
    result[:headers] = headers

    Property.bulk_insert do |worker|
      env.each do |name, value|
        worker.add({name: name, source: 'env', value: value, event_id: event.id})
      end
      headers.each do |name, value|
        worker.add({name: name, source: 'header', value: value, event_id: event.id})
      end
    end

    result[:params] = params
    if api.nil?
      result[:api_name] = 'Not found'
    else
      result[:api_name] = api.name
    end
    respond_with result, location: apis_url
  end
end

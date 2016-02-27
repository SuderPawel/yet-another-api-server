class ApisController < ApplicationController
  def index
    @apis = Api.all
  end

  def show
    @api = Api.find(params[:id])
  end

  def new
    @api = Api.new
  end

  def edit
    @api = Api.find(params[:id])
  end

  def create
    @api = Api.new(api_params)
    @api.uuid = SecureRandom.uuid

    if @api.save
      redirect_to @api
    else
      render 'new'
    end
  end

  def update
    @api = Api.find(params[:id])

    if @api.update(api_params)
      redirect_to @api
    else
      render 'edit'
    end
  end

  def destroy
    @api = Api.find(params[:id])
    @api.destroy

    redirect_to apis_path
  end

  def events
    @events = Event.where(api_id: params[:id])
  end

  def event
    @event = Event.find(params[:event_id])
  end

  private

  def api_params
    params.require(:api).permit(:name)
  end
end

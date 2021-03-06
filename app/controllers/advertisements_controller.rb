class AdvertisementsController < ApplicationController

  def index
    advertisements = Advertisement.includes(:city).eager_load(:city, :car_model)

    unless request.params[:city].blank?
      advertisements.where!(:city_id => request.params[:city])
    end

    unless request.params[:brand].blank?
      advertisements.where!('car_models.brand_id' => request.params[:brand])
    end

    unless request.params[:model].blank?
      advertisements.where!(:car_model_id => request.params[:model])
    end

    @advertisements = advertisements.page(request.params[:page]).per(9)
  end

  def show
  end

  def new

  end

  def edit
  end
end

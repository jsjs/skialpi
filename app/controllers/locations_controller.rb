# encoding: utf-8

class LocationsController < ApplicationController

  before_filter :signed_in_user, except: [:index, :show]
  
  before_filter :admin_user, only: :destroy
  
  def new
    @location = Location.new
  end
  
  def create
    @location = Location.new(params[:location])
    if @location.save
      flash[:success] = "Lokalita bola úspešne pridaná."
      redirect_to locations_path
    else
      render 'new'
    end
  end
  
  def edit
    @location = Location.find(params[:id])
  end
  
  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      flash[:success] = "Údaje o lokalite boli zmenené."
      redirect_to @location
    else
      render 'edit'
    end
  end
  
  def index
    @locations = Location.paginate(page: params[:page]).order(:name)
  end
  
  def show
    @location = Location.find(params[:id])
    @areas = @location.areas.paginate(page: params[:page])
  end
  
  def destroy
    Location.find(params[:id]).destroy
    flash[:success] = "Lokalita bola zmazaná."
    redirect_to "/locations"
  end
  
end

# encoding: utf-8

class TracksController < ApplicationController

  before_filter :signed_in_user, except: [:show, :index]
  before_filter :admin_user, only: [:change_area, :change_area_proc]
  
  def new
    @track = Track.new
  end
  
  def create
    area = Area.find(params[:id])
    @track = area.tracks.build(params[:track])
    
    if @track.save
      flash[:success] = "Zjazd bol úspešne pridaný."
      redirect_to area
    else
      render 'new'
    end
  end
  
  def show
    @track = Track.find(params[:id])
  end
  
  def index
    @tracks = Track.paginate(page: params[:page]).order(:name).includes(:area => :location)
  end
  
  def destroy
    Track.find(params[:id]).destroy
    flash[:success] = "Zjazd bol zmazaný."
    redirect_to "/locations"
  end
  
  #formular na zmanu oblasti
  def change_area 
    @track = Track.find(params[:id])
    @locations = []
    
    loc = Location.order(:name)
    loc.each do |location|
      areas = location.areas.order(:name)
      areas.each do |area|
        @locations << ["#{location.name} - #{area.name}", area.id]
      end
    end
    
  end
  
  # vykonanie zmeny oblasti
  def change_area_proc
    @track = Track.find(params[:id])
    areaid = params[:area_id]
    @area = Area.find(areaid)
    
    @track.update_attributes(:area_id => areaid)
    redirect_to "/tracks"
  end


end

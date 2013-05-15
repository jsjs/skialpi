# encoding: utf-8

class AreasController < ApplicationController

  before_filter :signed_in_user, except: :show
  before_filter :admin_user, only: :destroy
  
  def new
    @area = Area.new
  end
  
  def create
    location = Location.find(params[:id])
    @area = location.areas.build(params[:area])
    
    if @area.save
      flash[:success] = "Oblasť bola úspešne pridaná."
      redirect_to location
    else
      render 'new'
    end
  end
  
  def edit
    @area = Area.find(params[:id])
  end
  
  def update
    @area = Area.find(params[:id])
    
    if @area.update_attributes(params[:area])
      flash[:success] = "Údaje o oblasti boli zmenené."
      redirect_to @area
    else
      render 'edit'
    end
  end
  
  def show
    @area = Area.find(params[:id])
    @tracks = @area.tracks.paginate(page: params[:page])
  end
  
  def destroy
    @area = Area.find(params[:id]).destroy
    @redir_id = @area.location
    @area.destroy
    flash[:success] = "Oblasť bola vymazaná."
    redirect_to @redir_id
  end
  
end

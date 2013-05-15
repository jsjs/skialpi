# encoding: utf-8

class AchievementsController < ApplicationController

  before_filter :signed_in_user

  def new
    @achievement = Achievement.new
    @locations = Location.all
  end
  
  def update_areas
        location = Location.find(params[:location_id])
        @areas = location.areas.map{|a| [a.name, a.id]}.insert(0, "Vyberte si oblasť")
  end
 
  def update_tracks
      area = Area.find(params[:area_id])
      @tracks = area.tracks.map{|t| [t.name, t.id]}.insert(0, "Vyberte si zjazd")
  end
  
  def create
    @achievement = Achievement.new(params[:achievement])
    @user = current_user
    
    unless params[:track_id].empty? or (params[:track_id].to_i == 0)
      @track = Track.find(params[:track_id]) 
      @user.create_achievement(@track, @achievement.date, @achievement.time, @achievement.note)
      flash[:success] = "Zjazd bol pridaný do denníčka."
      redirect_to @user
    else
      @achievement.errors.add("Track","can not be empty.")
      @locations = Location.all
      render 'new'
    end
    
  end
  
end

# encoding: utf-8

class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user, only: [:edit, :update]  
  before_filter :admin_user, only: :destroy
  before_filter :not_signed_in_user, only: [:new, :create]
  
  def index
    @users = User.paginate(page: params[:page]).includes(:achievements)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    @user.show_email ||= false 
    @user.show_age ||= false
    
    if @user.save
      sign_in @user
      flash[:success] = "Boli ste úspešne zaregistrovaní."
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
    stats
    render 'stats'
  end
  
  def edit
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Vaše údaje boli zmenené."
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
 
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Používateľ bol zmazaný."
    redirect_to users_url
  end  
  

  
  def achievements
    @user = User.find(params[:id])
    @achievements = @user.achievements_ordered.paginate(page: params[:page])
    
    @all_class = "active"
    @subtitle = "Všetky zjazdy"
    
    @sum = @achievements.sum(:points)
  end
  
  def season
    @user = User.find(params[:id])
    @achievements = @user.season_achievements.paginate(page: params[:page])
   
    @season_class = "active"
    year = Time.new.year
    @subtitle = "Sezóna - #{year}"
    
    @sum = @achievements.sum(:points)
    render 'achievements'
  end
  
  def top10
    @user = User.find(params[:id])
    @achievements = @user.top10_achievements
  
    @sum = @user.top10_points_p(@achievements)

    @achievements = @achievements.paginate(page: params[:page], :per_page => 10, :total_entries => @achievements.count)
    @top10_class = "active"
    @subtitle = "Top10"
    render 'achievements'
  end
  
  def stats
    @user = User.find(params[:id])
    @all_points = @user.achievements.sum(:points)
    @tracks_count = @user.achievements.count
    @season_points = @user.season_achievements.sum(:points)
    @seasons_tracks_count = @user.season_achievements.count
    @top10_points = @user.top10_points
    @last_achv = @user.achievements.last
    @first_achv = @user.achievements.first
   
    @stats_class = "active"
    @subtitle = "Štatistiky"
  end

    
end

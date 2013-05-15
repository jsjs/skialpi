# encoding: utf-8

class BugReportsController < ApplicationController

  before_filter :signed_in_user
  before_filter :admin_user, except: [:new, :create]

  
  def new
    @bug = BugReport.new
  end
  
  def create
    @bug = current_user.bug_reports.build(params[:bug_report])
    @bug.user_id = current_user.id
    
    if @bug.save
      flash[:success] = "Chyba bola ohlásená. Ďakujeme."
      redirect_to current_user
    else
      render 'new'
    end
  end
  
  def index 
    @bugs = BugReport.paginate(page: params[:page]).order("created_at DESC").includes(:user)
  end
  
  def show
    @bug = BugReport.find(params[:id])
  end
  
  def destroy
    BugReport.find(params[:id]).destroy
    flash[:success] = "Ohlásenie chyby bolo odstránené."
    redirect_to '/bug_reports'
  end
  
  
  
end

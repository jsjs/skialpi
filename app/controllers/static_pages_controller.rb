class StaticPagesController < ApplicationController

  def home
    achievements_order(3);
    season_order(3);
  end

  def about
  end
  
  def contact
  end
  
  def help
  end
  
end

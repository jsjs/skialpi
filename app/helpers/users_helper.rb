module UsersHelper

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
  # methods for controlling whether user is signed in
  private

    def signed_in_user
      redirect_to signin_url, notice: "Na tuto akciu potrebujete byt prihlaseni." unless signed_in? 
    end
    
    def not_signed_in_user
      redirect_to root_path if signed_in? 
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end


end

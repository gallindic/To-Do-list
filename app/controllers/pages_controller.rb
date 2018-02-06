class PagesController < ApplicationController
  def home
  end

  def profile
    if(User.find_by_username(params[:id]))
      @username = params[:id]
    else
      #Redirect to 404 not found
      redirect_to root_path, :notice=> "User not found"
    end
  end

  def createBoard
  end
  
  def createTeam
  end

  def board
  end
  
  def notifications
  end
  
  def settings
  end
end

class PagesController < ApplicationController
  def index

  end

  def top
     if user_signed_in?
    redirect_to '/profiles'
  end
 
  end

  def show
  end
end

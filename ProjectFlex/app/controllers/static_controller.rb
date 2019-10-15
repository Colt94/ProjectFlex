class StaticController < ApplicationController
  def home
  end
  
  def about
  end
  
  def contact
  end
  
  def staff
    @staff = User.all
  end
end

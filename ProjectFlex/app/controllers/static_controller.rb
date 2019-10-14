class StaticController < ApplicationController
  def home
  end
  
  def about
  end
  
  def contact
  end
  
  def staff
    @staffnames = User.all.get_names
  end
end

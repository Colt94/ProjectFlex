class StaticController < ApplicationController
  @@firstVisit = true
  def home
    #if(@@firstVisit == true)
     # session.clear
      #@@firstVisit = false
    #end
  end
  
  def about
  end
  
  def contact
  end
  
  def staff
    @staff = User.all
  end
end

class StaticController < ApplicationController
  @@firstVisit = true
  def home
    #if(@@firstVisit == true)
     # session.clear
      #@@firstVisit = false
    #end
  end

end

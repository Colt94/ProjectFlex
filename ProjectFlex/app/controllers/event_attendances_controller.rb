class EventAttendancesController < ApplicationController
   
   def create
       eventAttendance = { :user_id => session[:cas_user], :event_id => params[:event_id], :status => "submitted" }
       EventAttendance.create!(eventAttendance)
       redirect_to event_path(params[:event_id])
   end
    
end
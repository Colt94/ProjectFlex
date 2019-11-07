class EventAttendancesController < ApplicationController
   
   def create
       eventAttendance = { :user_id => session[:cas_user], :event_id => params[:event_id], :status => "submitted" }
       EventAttendance.create!(eventAttendance)
       redirect_to event_path(params[:event_id])
   end
   
   def destroy
       EventAttendance.destroy_single_attendance(params[:user], params[:event])
       redirect_to event_path(params[:event])
   end
    
end
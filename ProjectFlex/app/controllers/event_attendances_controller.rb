class EventAttendancesController < ApplicationController
   
   def create
       user = User.get_user(session[:cas_user])
       eventAttendance = { :user_id => session[:cas_user], :user_name => user.name, :event_id => params[:event_id], :status => "submitted", :user_zone => params[:user_zone] }
       EventAttendance.create!(eventAttendance)
       Event.add_registration(params[:event_id])
       redirect_to event_path(params[:event_id])
   end
   
   def destroy
       EventAttendance.destroy_single_attendance(params[:user], params[:event])
       Event.remove_registration(params[:event])
       redirect_to event_path(params[:event])
   end
    
end
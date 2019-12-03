require File.expand_path("../../../config/environment", __FILE__)
require_relative '../../app/controllers/end_of_semester_controller'

require 'rails_helper'

describe EndOfSemesterController, type: :controller  do
    describe "GET end_of_semester#clearpoints" do
        it "returns a 200 OK status" do
            get "clearpoints"
            expect(response).to have_http_status(:ok)
        end
    end
    
    describe "GET end_of_semester#changeyear" do
        it "returns a 200 OK status" do
            get "changeyear"
            expect(response).to have_http_status(:ok)
        end
    end
    
    describe "Clear points" do
        it "clearpointsconfirmed to succeed" do
            get(:clearpointsconfirmed, params: nil, session: {'cas_user' => "joseph20santana"})
            expect(subject).to redirect_to('/calendar')
        end
    end
    
    describe "Beginning new year" do
        it "Redirect back to end_of_semester#changeyear" do 
            get(:beginNewYear, params: nil, session: {'cas_user' => "joseph20santana"})
            expect(subject).to redirect_to('/changeyear?inputError=true')
        end
        
        
    end
    
    describe "responds to" do
        it "responds to html by default" do
          post :changeyear
          expect(response.content_type).to eq "text/html"
        end
        
        it "responds to html by default" do
          post :clearpoints
          expect(response.content_type).to eq "text/html"
        end
    end
    
end
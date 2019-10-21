# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_list = [
    { :name => "Grant", :permissions => "exec", :net_id => "grant.123" },
    { :name => "Emily", :permissions => "exec", :net_id => "emily.123" },
    { :name => "Kelsey", :permissions => "exec", :net_id => "kelsey.123" },
    { :name => "Monty", :permissions => "exec", :net_id => "monty.123" },
    { :name => "Kelly", :permissions => "exec", :net_id => "kelly.123" },
    { :name => "Ashley",:permissions => "zl", :net_id => "ashley.123" },
    { :name => "Jacob", :permissions => "zl", :net_id => "jacob.123" },
    { :name => "Catherine", :permissions => "zl", :net_id => "catherine.123" },
    { :name => "Maggie", :permissions => "member", :net_id => "maggie.123" },
    { :name => "Evan", :permissions => "member", :net_id => "evan.123" },
    { :name => "Macy", :permissions => "member", :net_id => "macy.123" },
    { :name => "Alex", :permissions => "member", :net_id => "alex.123" },
    { :name => "Gia", :permissions => "member", :net_id => "gia.123" }
]

# would we get event_id from event_list?
attendance_list = [
    { :user_id => "grant.123", :event_id => 1, :status => "approved" },
    { :user_id => "emily.123", :event_id => 1 },
    { :user_id => "kelsey.123", :event_id => 1 },
    { :user_id => "monty.123", :event_id => 1, :status => "approved" },
    { :user_id => "kelly.123", :event_id => 1, :status => "approved" },
    { :user_id => "ashley.123", :event_id => 1, :status => "approved" },
    { :user_id => "jacob.123", :event_id => 1 },
    { :user_id => "catherine.123", :event_id => 1, :status => "approved" },
    { :user_id => "maggie.123", :event_id => 1, :status => "approved" },
    { :user_id => "evan.123", :event_id => 1, :status => "approved" },
    { :user_id => "macy.123", :event_id => 1, :status => "approved" },
    { :user_id => "alex.123", :event_id => 1, :status => "approved" },
    { :user_id => "gia.123", :event_id => 1, :status => "approved" }
]

event_list = [
    { :name => "Chick-fil-A Profit Share", :date => "2019-10-15T18:30:00", :point_value => 2, :point_type => "fr" },
    { :name => "Winter Formal", :date => "2019-10-02T20:00:00", :point_value => 3, :point_type => "social" },
    { :name => "Big Event", :date => "2019-10-20T07:00:00", :point_value => 4, :point_type => "service" }
]

user_list.each do |user|
    User.create!(user)
end

attendance_list.each do |attendance|
    EventAttendance.create!(attendance)
end

event_list.each do |event|
    Event.create!(event)
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_list = [

    { :name => "Grant", :permissions => "Exec", :net_id => "hillwest36", :user_zone => "LD" },
    { :name => "Emily", :permissions => "Exec", :net_id => "emily.123", :user_zone => "LD"  },
    { :name => "Kelsey", :permissions => "Exec", :net_id => "kelsey.123", :user_zone => "LD"  },
    { :name => "Monty", :permissions => "Exec", :net_id => "monty.123", :user_zone => "FR"  },
    { :name => "Kelly", :permissions => "Exec", :net_id => "kelly.123", :user_zone => "FR"  },
    { :name => "Ashley",:permissions => "ZL", :net_id => "ashley.123", :user_zone => "FR"  },
    { :name => "Jacob", :permissions => "ZL", :net_id => "jacob.123", :user_zone => "PR"  },
    { :name => "Catherine Dietlein", :permissions => "ZL", :net_id => "catherine.123", :user_zone => "PR"  },
    { :name => "Maggie", :permissions => "Member", :net_id => "maggie.123", :user_zone => "PR"  },
    { :name => "Evan", :permissions => "Member", :net_id => "evan.123", :user_zone => "Social"  },
    { :name => "Macy", :permissions => "Member", :net_id => "macy.123", :user_zone => "Social"  },
    { :name => "Alex", :permissions => "Member", :net_id => "alex.123", :user_zone => "Social"  },
    { :name => "Gia", :permissions => "Member", :net_id => "gia.123", :user_zone => "Service"  },
    { :name => "Colton", :permissions => "Member", :net_id => "coltmo", :user_zone => "Service"  },
    { :name => "Joseph", :permissions => "ZL", :net_id => "joseph20santana", :user_zone => "Service"  },
    { :name => "Brett", :permissions => "Exec", :net_id => "brett.martin", :user_zone => "Service"  },
    { :name => "Josh", :permissions => "Exec", :net_id => "jdmcafee24", :user_zone => "Social"  },
    { :name => "Nathan", :permissions => "ZL", :net_id => "a.123", :user_zone => "LD"  },
    { :name => "Meagan", :permissions => "ZL", :net_id => "b.123", :user_zone => "LD"  },
    { :name => "Colin", :permissions => "Member", :net_id => "c.123", :user_zone => "LD"  },
    { :name => "Deyton", :permissions => "Member", :net_id => "d.123", :user_zone => "LD"  },
    { :name => "Jack", :permissions => "Member", :net_id => "e.123", :user_zone => "LD"  },
    { :name => "JacobB", :permissions => "Member", :net_id => "f.123", :user_zone => "LD"  },
    { :name => "Livia", :permissions => "Member", :net_id => "g.123", :user_zone => "LD"  },
    { :name => "Ty", :permissions => "Member", :net_id => "h.123", :user_zone => "LD"  },
    { :name => "Sydney", :permissions => "Member", :net_id => "i.123", :user_zone => "LD"  },
    { :name => "Parker", :permissions => "Member", :net_id => "j.123", :user_zone => "LD"  },
    { :name => "Reed", :permissions => "Member", :net_id => "k.123", :user_zone => "LD"  },
    { :name => "Erika", :permissions => "Member", :net_id => "l.123", :user_zone => "PR"  }
]

attendance_list = [
    { :user_id => "maggie.123", :user_name => "Maggie", :event_id => 1, :status => "approved", :user_zone => "PR" },
    { :user_id => "evan.123", :user_name => "Evan", :event_id => 2, :status => "submitted", :user_zone => "Social"},
    { :user_id => "macy.123", :user_name => "Macy", :event_id => 1, :status => "approved", :user_zone => "Social" },
    { :user_id => "alex.123", :user_name => "Alex", :event_id => 3, :status => "approved", :user_zone => "Social" },
    { :user_id => "gia.123", :user_name => "Gia", :event_id => 1, :status => "submitted", :user_zone => "Service" },
    { :user_id => "evan.123", :user_name => "Evan", :event_id => 3, :status => "approved", :user_zone => "Social" },
    { :user_id => "maggie.123", :user_name => "Maggie", :event_id => 2, :status => "submitted", :user_zone => "PR" },
    { :user_id => "maggie.123", :user_name => "Maggie", :event_id => 4, :status => "submitted", :user_zone => "PR" },
    { :user_id => "alex.123", :user_name => "Alex", :event_id => 4, :status => "submitted", :user_zone => "Social" },
]

event_list = [
    { :name => "Chick-fil-A Profit Share", :date => "2019-11-15T18:30:00", :point_value => 1, :point_type => "FR", :location => "Chick-fil-A on Texas", :details => "Send a pic of your receipt\nMention Flex to Cashier", :max_signups => 4, :current_signups => 3},
    { :name => "Winter Formal", :date => "2019-11-02T20:00:00", :point_value => 1, :point_type => "Social", :location => "(Winter Formal Address)", :details => "Dress Code: (...)", :current_signups =>  2},
    { :name => "Big Event", :date => "2019-11-20T07:00:00", :point_value => 1, :point_type => "Service", :location => "(Big Event Address)", :details => "Show up", :current_signups => 2, :mandatory => true },
    { :name => "Gen Meeting", :date => "2019-11-25T20:30:00", :point_value => 0, :point_type => "LD", :location => "MSC 2406B", :details => "Show up", :current_signups => 2}
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
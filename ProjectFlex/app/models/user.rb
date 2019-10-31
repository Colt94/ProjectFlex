class User < ApplicationRecord
    # def self.get_names
    #     User.select("name", "permissions")
    # end
    # def self.get_ids
    #     User.select("id")
    # end
<<<<<<< HEAD
    def self.get_permissions
     User.select("permissions") 
    end
    
    def self.get_user(username) 
        User.find_by(net_id: username)
=======
    # def self.get_permissions
    #     User.select("permissions") 
    # end
    def self.get_user(netid) 
        User.find_by(net_id: netid)
>>>>>>> be8900592faf4473077da5c97b5238841ea9e47a
    end
    
    
    def User.search_netid(netid)
       return (User.where("net_id" => netid)).size 
    end
end

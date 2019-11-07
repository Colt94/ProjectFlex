class User < ApplicationRecord
    # def self.get_names
    #     User.select("name", "permissions")
    # end
    # def self.get_ids
    #     User.select("id")
    # end
    # def self.get_permissions
    #     User.select("permissions") 
    # end
    def self.get_user(netid) 
        User.find_by(net_id: netid)
    end
    
    
    def self.search_netid(netid)
       return (User.where("net_id" => netid)).size 
    end
    
    def self.get_all_users()
        return User.all
    end
    
    def self.get_all_permissions()
        return ["Exec", "ZL", "Member"]    
    end
end

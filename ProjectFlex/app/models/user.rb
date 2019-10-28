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
    
    def User.search_netid(netid)
       return (User.where("net_id" => netid)).size 
    end
end

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
        return User.all.order("name")
    end
    
    def self.get_all_members()
        return User.where("permissions" => "Member")    
    end
    
    def self.get_all_permissions()
        return ["Exec", "ZL", "Member"]    
    end
    
    def self.points_met?(fr_total, social_total, service_total, ld_total, pr_total)
        points_met = false
        if(fr_total == 2 && social_total == 3 && service_total == 3 && ld_total == 1 && pr_total == 3)
            points_met = true
        end
        points_met
    end

    def self.get_permission(id)
        user = User.find(id)
        return user.permissions
    end
    
    def self.delete_user(id)
        User.destroy(id)   
    end
    
    def self.wipe()
        User.destroy_all
    end
    
    def self.promote(id)
        user = User.find(id)
        if(user.permissions == "Member")
            user.update(permissions: "ZL")
        elsif(user.permissions == "ZL")
            user.update(permissions: "Exec")
        end
        user.save!
    end
end

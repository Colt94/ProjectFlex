class MenuSideBarItem
    
    attr_accessor :caption, :option_hash
    
    def initialize(caption, option_hash = {})
        @caption = caption
        @option_hash = option_hash
    end
end

class MenuSideBar

    attr_accessor :items
    
    def self.load_from_list(list_items)
        sideBar = MenuSideBar.new
        list_items.each do | caption, options |
            sideBar.append_link(caption, options)
        end
        sideBar
    end
        
    def initialize
        @items = []
    end
    
    def append_link(caption, url_hash = {})
        items << MenuSideBarItem.new(caption, url_hash)
    end
        
end

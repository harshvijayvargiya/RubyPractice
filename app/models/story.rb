class Story < ApplicationRecord
    before_create :set_default_value
    scope :active_stories,-> { where(is_active: true) }
    scope :inactive_stories,-> { where(is_active: false) }  
    def set_default_value
        self.is_active = false
    end
end

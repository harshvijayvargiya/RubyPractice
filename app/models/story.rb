class Story < ApplicationRecord
    before_create :set_default_value

    def set_default_value
        self.is_active = false
    end
end

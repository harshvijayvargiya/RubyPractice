class Profile < ApplicationRecord
    has_many :pictures, as: :imageable
end

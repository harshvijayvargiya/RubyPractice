class Student < ApplicationRecord
  has_many :pictures, as: :imageable
end

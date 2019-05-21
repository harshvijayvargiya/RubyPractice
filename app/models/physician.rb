class Physician < ApplicationRecord
    has_many :appointments
    has_many :patient, :through => :appointments, dependent: :destroy
end

class Account < ApplicationRecord
  belongs_to :supplier,dependent: :destroy
  has_one :accounthistory
end

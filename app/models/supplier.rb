class Supplier < ApplicationRecord
    has_one :account
    has_one :accounthistory, :through => :account
end

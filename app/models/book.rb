class Book < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', dependent: :destroy
end

class Comment < ApplicationRecord
  belongs to :user
  belongs to :item
end

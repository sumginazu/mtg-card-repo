class Collection < ApplicationRecord
  has_many :collection_card_instances
  has_many :card_instances, through: :collection_card_instances
  has_many :collection_users
  has_many :users, through: :collection_users
end

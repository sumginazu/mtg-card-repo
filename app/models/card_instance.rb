class CardInstance < ApplicationRecord
  belongs_to :card
  belongs_to :user
  has_many :collection_card_instances
  has_many :collections, through: :collection_card_instances
end

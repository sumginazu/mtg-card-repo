class CreateCollectionCardInstances < ActiveRecord::Migration[5.0]
  def change
    create_table :collection_card_instances do |t|
      t.belongs_to :collection, index: true
      t.belongs_to :card_instance, index: true

      t.timestamps
    end
  end
end

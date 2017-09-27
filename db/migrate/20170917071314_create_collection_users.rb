class CreateCollectionUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :collection_users do |t|
      t.belongs_to :collection, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

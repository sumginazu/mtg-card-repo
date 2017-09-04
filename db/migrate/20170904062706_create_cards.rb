class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :layout
      t.string :name
      t.string :names
      t.string :mana_cost
      t.integer :cmc
      t.string :colors
      t.string :color_identity
      t.string :type_line
      t.string :supertypes
      t.string :types
      t.string :subtypes
      t.string :rarity
      t.text :text
      t.text :flavor
      t.string :artist
      t.string :number
      t.string :power
      t.string :toughness
      t.string :loyalty
      t.integer :multiverseid
      t.string :variations
      t.string :image_name
      t.string :watermark
      t.string :border
      t.integer :timeshifted
      t.integer :hand
      t.integer :life
      t.boolean :reserved
      t.date :release_date
      t.boolean :starter
      t.integer :mci_number
      t.text :rulings
      t.text :foreign_names
      t.string :printings
      t.text :original_text
      t.string :original_type
      t.string :legalities
      t.string :source

      t.timestamps
    end
  end
end

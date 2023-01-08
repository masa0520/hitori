class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.text :body
      t.string :title, null: false
      t.references :user, foreign_key: true,  null: false
      t.float :latitude
      t.float :longitude
      t.string :address
      
      t.timestamps
    end
  end
end

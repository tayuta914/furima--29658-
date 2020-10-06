class CreatePersonals < ActiveRecord::Migration[6.0]
  def change
    create_table :personals do |t|
      t.integer :prefecture_id ,null: false
      t.string :address ,null: false
      t.string :city ,null: false
      t.string :telephone ,null: false
      t.string :postal_code ,null: false
      t.string :building 
      t.references :user ,null: false, foreign_key:true 
      t.references :order ,null: false, foreign_key:true
      t.timestamps
    end
  end
end

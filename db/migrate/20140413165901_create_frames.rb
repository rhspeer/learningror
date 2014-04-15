class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.string :name
      t.integer :brand_id

      t.timestamps
    end
  end
end

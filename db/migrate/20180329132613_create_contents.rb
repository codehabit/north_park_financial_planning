class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.integer :author_id
      t.text :body
      t.string :name
      t.string :location_id
    end
  end
end

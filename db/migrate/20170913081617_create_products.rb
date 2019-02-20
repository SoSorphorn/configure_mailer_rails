class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.text :file

      t.timestamps
    end
  end
end

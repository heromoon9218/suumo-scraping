class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.integer :rent
      t.integer :administration

      t.timestamps
    end
  end
end

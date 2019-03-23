class CreateTrees < ActiveRecord::Migration[5.2]
  def change
    create_table :trees, id: false do |t|
      t.integer :id, primary_key: true
      t.text :child

      t.timestamps
    end
  end
end

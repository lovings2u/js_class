class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :board
      t.text :contents
      t.timestamps null: false
    end
  end
end

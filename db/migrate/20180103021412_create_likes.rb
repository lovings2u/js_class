class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user
      t.references :board
      t.timestamps null: false
    end
  end
end

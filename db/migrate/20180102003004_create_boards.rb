class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.references :user
      t.string :title
      t.text :contents

      t.timestamps null: false
    end
  end
end

class CreateLetters < ActiveRecord::Migration[7.0]
  def change
    create_table :letters do |t|
      t.string :name
      t.string :phone
      t.string :title
      t.string :description
      t.string :files
      t.string :email

      t.timestamps
    end
  end
end

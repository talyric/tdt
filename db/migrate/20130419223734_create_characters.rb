class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :career
      t.integer :age
      t.string :gender
      t.string :alignment
      t.integer :str
      t.integer :ref
      t.integer :int
      t.integer :con
      t.integer :wil
      t.integer :dex
      t.integer :ath
      t.integer :spd
      t.integer :initiative

      t.timestamps
    end
  end
end

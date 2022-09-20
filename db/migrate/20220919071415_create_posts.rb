class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :postscounter
      t.integer :likescounter
      t.integer :commentscounter

      t.timestamps
    end
  end
end

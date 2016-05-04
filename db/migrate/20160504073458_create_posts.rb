class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :post
      t.text :autor
      t.timestamps

    end

    create_table :comments do |t|
      t.belongs_to :posts, index:true
      t.text :comment
      t.text :autor
      t.timestamps
    end

  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, index: true, foreign_key: true #adds 'article_id'

      t.timestamps null: false
    end
  end
end


# class CreateComments < ActiveRecord::Migration
#   def change
#     create_table :comments do |t|
#       t.string :commenter
#       t.text :body

#       # this line adds an integer column called `article_id`.
#       t.references :article, index: true

#       t.timestamps null: false
#     end
#     add_foreign_key :comments, :articles
#   end
# end

# Tutorial expected above, very slightly different with foreign key assignments
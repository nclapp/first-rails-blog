class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy # dependent so comments are deleted when/if article is
  validates :title, presence: true,
                    length: { minimum: 5 }
end

# If you delete an article, its associated comments will also need to be deleted, otherwise they would simply occupy space in the database. Rails allows you to use the dependent option of an association to achieve this.
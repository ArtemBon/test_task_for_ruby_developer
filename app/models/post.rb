class Post < ApplicationRecord
  belongs_to :category

  after_create :update_title

  private
    def update_title
      self.title = "title #{id}"
      save
    end
end

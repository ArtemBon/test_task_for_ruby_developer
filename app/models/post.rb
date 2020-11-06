class Post < ApplicationRecord
  belongs_to :category

  after_create :update_title
  after_create :set_shared_url
  after_create :cleanup_shared_url

  private
    def update_title
      update(title: "title #{id}")
    end

    def set_shared_url
      update(shared_url: SecureRandom.urlsafe_base64)
    end

    def cleanup_shared_url
      SharedUrlsCleanupJob.set(wait: 15.minutes).perform_later(self)
    end
end

class SharedUrlsCleanupJob < ApplicationJob
  queue_as :default

  def perform(post)
    post.update(shared_url: nil)
  end
end

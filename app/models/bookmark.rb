require 'lib/slug_generator'

class Bookmark < ActiveRecord::Base
  default_scope -> { order :created_at => :desc }
  validates :title, :url, :presence => true

  after_create :add_slug

  private

  def add_slug
    self.update_attribute(:slug, SlugGenerator.new(self.id).generate)
  end
end

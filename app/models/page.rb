class Page < ActiveRecord::Base
  attr_accessible :content, :published_on, :title
  
  validates :title, :content, :presence => true
  
  scope :latest, order("published_on DESC")
  scope :published, where("published_on is not null")
  scope :unpublished, where("published_on is null")
  
  def total_words
    self.content.split(/\S+/).size
  end
  
  def publish!
    self.update_attribute(:published_on, Time.now)
  end
end

class Video < ApplicationRecord
  validates_presence_of :video_url
  #association
  belongs_to :user
  def like!
	  self.likes += 1
	  save
  end
  def dislike!
	  self.likes -= 1
	  save
  end

end

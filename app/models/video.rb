class Video < ApplicationRecord
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

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  has_many :notification, dependent: :destroy
  
end

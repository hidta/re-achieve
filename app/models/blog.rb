class Blog < ActiveRecord::Base
    validates :title, presence: true
    belongs_to :user
    has_many :comments, dependent: :destroy
    mount_uploader :pic_url, PicUrlUploader
    
end

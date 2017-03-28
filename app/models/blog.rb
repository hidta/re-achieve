class Blog < ActiveRecord::Base
    validates :title, presence: true
    belongs_to :user
    has_many :comments, dependent: :destroy
    mount_uploader :pic_url, PicUrlUploader
    paginates_per 5
    
    scope :index_all, -> {
        select(:id, :title, :content, :created_at)
        .order(created_at: :asc)
        .includes(:user)
    }
end

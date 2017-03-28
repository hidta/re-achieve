class PicUrl < ActiveRecord::Migration
  def change
    add_column :blogs, :pic_url, :string
  end
end

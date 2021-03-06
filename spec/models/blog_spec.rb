require 'rails_helper'

describe Blog do
  it "is valid with title" do
    blog = Blog.new(title:"hello", content:"world") 
    expect(blog).to be_valid
  end

  it "is invalid without a title" do
    blog = Blog.new
    expect(blog).not_to be_valid
  end

  it "is valid with title" do
    blog = Blog.new
    blog.valid?
    expect(blog.errors[:title]).to include("を入力してください")
  end
end
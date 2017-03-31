require 'rails_helper'

describe Contact do
  describe "valid Contact" do
    it "is valid with" do
      @contact = Contact.new(name:"jhon",content:"hello",email:"a@a")
      expect(@contact).to be_valid
    end
  end

  describe "invalid without name content email" do
    before do
      @contact = Contact.new(name:nil,content:nil,email:nil)
    end

    it "is invalid without" do
      expect(@contact).not_to be_valid
    end

    it "is valid with name" do 
      contact = @contact
      contact.invalid?
      expect(@contact.errors[:name]).to include("を入力してください")
      expect(@contact.errors[:content]).to include("を入力してください")
      expect(@contact.errors[:email]).to include("を入力してください")
    end

  end
end
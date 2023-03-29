require 'rails_helper'

RSpec.describe Video, type: :model do

  subject { Video.create(id: 1, title: "Basic rspec Ruby on Rails model specs", description: "In this episode you'll learn some basics for testing simple methods on Ruby on Rails models.", url: "https://www.youtube.com/watch?v=Spogv4o8haM", category_id: 3) }

  let(:category) { Category.create(id: 3, title: "YouTube", color: "red") }
  
  describe "association" do
    it { should belong_to(:category) }
  end

  describe "validation" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:url)}
  end

  describe "creation" do

    it "create a video" do
      video = Video.create(title: "Basic rspec Ruby on Rails model specs",
        description: "In this episode you'll learn some basics for testing simple methods on Ruby on Rails models.",
        url: "https://www.youtube.com/watch?v=Spogv4o8haM",
        category_id: category.id)
      
      expect(Video.count).to eq(1)
      expect(video.title).to eq("Basic rspec Ruby on Rails model specs")
    end

    it "find video by id" do
      video = Video.create(title: "Basic rspec Ruby on Rails model specs",
        description: "In this episode you'll learn some basics for testing simple methods on Ruby on Rails models.",
        url: "https://www.youtube.com/watch?v=Spogv4o8haM",
        category_id: category.id)
      
      expect(video.id).to eq(1)
      expect(video.title).to eq("Basic rspec Ruby on Rails model specs")
    end
    
  end
end

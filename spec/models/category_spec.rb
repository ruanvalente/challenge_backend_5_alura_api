require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:category) { Category.create(id: 1, title: "Programming", color: "blue")}
  let!(:video) { Video.create(
    id: 1, 
    title: "Basic rspec Ruby on Rails model specs", 
    description: "In this episode you'll learn some basics for testing simple methods on Ruby on Rails models.", 
    url: "https://www.youtube.com/watch?v=Spogv4o8haM", 
    category_id: category.id
    ) }

  describe "association" do
    it { should have_many(:videos) }
  end

  describe "validation" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:color) }
  end

  describe "creation" do
    it "create a category" do
      expect(Category.count).to eq(1)
    end

    it "find category by id" do
      category_result = Category.find_by(id: 1)

      expect(category).to have_attributes(
        id: category_result.id,
        title: category_result.title,
        color: category_result.color
      )
    end

    it "update category by id" do
      update_category = Category.find(category.id)
      update_category.title = "Free"

      expect(update_category.id).to eq(1)
      expect(update_category.title).to eq("Free")
    end

    it "remove category by id" do
      expect { Category.destroy(category.id) }.to change { Category.count }.by(-1)
      expect { Category.find(category.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "does not update category by id when id is not found" do
      update_category = Category.find_by(id: 2)
      expect(update_category).to be_nil

      result = update_category&.update(title: "YouTube")
      expect(result).to be_falsey
    end
  end
end

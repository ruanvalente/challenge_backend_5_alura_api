require 'rails_helper'

RSpec.describe Video, type: :model do
  let!(:category) { Category.create(id: 3, title: 'YouTube', color: 'red') }
  let!(:video) do
    Video.create(
      id: 1,
      title: 'Basic rspec Ruby on Rails model specs',
      description: "In this episode you'll learn some basics for testing simple methods on Ruby on Rails models.",
      url: 'https://www.youtube.com/watch?v=Spogv4o8haM',
      category_id: category.id
    )
  end

  describe 'association' do
    context 'should belong to the category' do
      it { should belong_to(:category) }
    end
  end

  describe 'validation' do
    context 'should validate presence of the field' do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:description) }
      it { should validate_presence_of(:url) }
      it { should validate_presence_of(:category_id) }
    end
  end

  describe 'validates' do
    context 'when creating a new video' do
      it {
        expect(Video.count).to eq(1)
        expect(video.title).to eq('Basic rspec Ruby on Rails model specs')
      }

      context 'when fiding a video by id' do
        it {
          expect(video.id).to eq(1)
          expect(video.title).to eq('Basic rspec Ruby on Rails model specs')
        }
      end

      context 'when update video by id' do
        it {
          update_video = Video.find(video.id)
          update_video.title = 'New title for video'

          expect(update_video.id).to eq(1)
          expect(update_video.title).to eq('New title for video')
        }
      end

      context 'when remove video by id' do
        it {
          expect { Video.destroy(video.id) }.to change { Video.count }.by(-1)
          expect { Video.find(video.id) }.to raise_error(ActiveRecord::RecordNotFound)
        }
      end
    end
  end

  describe 'invalid' do
    context 'does not update video by id when id is not found' do
      it {
        update_video = Video.find_by(id: 2)
        expect(update_video).to be_nil

        result = update_video&.update(title: 'New title')
        expect(result).to be_falsey
      }
    end
  end
end

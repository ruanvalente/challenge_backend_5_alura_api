require "test_helper"

class VideoTest < ActiveSupport::TestCase
  test "should create video" do
    video = Video.new :title => "Trainee 2022/2 - Models no Rails", :description => "Aula sobre models no Rails", :url => "https://www.youtube.com/watch?v=OQsCRI1hzec&list=PLPDMfYZSRJ0l5AhPMK_x12MsZPRLjY2KV&index=6", :category_id => 3

    video.save

    assert_equal "Trainee 2022/2 - Models no Rails", video.title
    assert_equal "Aula sobre models no Rails", video.description
    assert_equal "https://www.youtube.com/watch?v=OQsCRI1hzec&list=PLPDMfYZSRJ0l5AhPMK_x12MsZPRLjY2KV&index=6", video.url
    assert_equal 3, video.category_id
  end

  test "should not created video without category id" do
    video = Video.new :title => "Trainee 2022/2 - Models no Rails", :description => "Aula sobre models no Rails", :url => "https://www.youtube.com/watch?v=OQsCRI1hzec&list=PLPDMfYZSRJ0l5AhPMK_x12MsZPRLjY2KV&index=6", :category_id => nil

    video.save
    
    assert_equal nil, video.category_id
    assert_not false, video
  end
end

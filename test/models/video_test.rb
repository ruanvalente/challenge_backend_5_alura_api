require "test_helper"

class VideoTest < ActiveSupport::TestCase
  test "should create video" do
    video = Video.create(title: "Trainee 2022/2 - Models no Rails", description: "Aula sobre models no Rails", url: "https://www.youtube.com/watch?v=OQsCRI1hzec&list=PLPDMfYZSRJ0l5AhPMK_x12MsZPRLjY2KV&index=6", category_id: 3)

    assert_equal "Trainee 2022/2 - Models no Rails", video.title
    assert_equal "Aula sobre models no Rails", video.description
    assert_equal "https://www.youtube.com/watch?v=OQsCRI1hzec&list=PLPDMfYZSRJ0l5AhPMK_x12MsZPRLjY2KV&index=6", video.url
    assert_equal 3, video.category_id
  end

  test "should not created video without category id" do
    video = Video.create(title: "Trainee 2022/2 - Models no Rails", description: "Aula sobre models no Rails", url: "https://www.youtube.com/watch?v=OQsCRI1hzec&list=PLPDMfYZSRJ0l5AhPMK_x12MsZPRLjY2KV&index=6", category_id: nil)
    
    assert_nil nil, video.category_id
    assert_not false, video
  end

  test "should list video by id" do
    video = Video.create(id: 1, title: "Trainee 2022/2 - Models no Rails", description: "Aula sobre models no Rails", url: "https://www.youtube.com/watch?v=OQsCRI1hzec&list=PLPDMfYZSRJ0l5AhPMK_x12MsZPRLjY2KV&index=6", category_id: 3)

    assert_equal 1, video.id
  end

  test "should search video by title" do
    video1 = Video.create(id: 1, title: "Trainee 2022/2 - Models no Rails", description: "Aula sobre models no Rails", url: "https://www.youtube.com/watch?v=OQsCRI1hzec&list=PLPDMfYZSRJ0l5AhPMK_x12MsZPRLjY2KV&index=6", category_id: 3)

    video2 = Video.create(id: 2, title: "Estrutura de dados", description: "Aula sobre estrutura de dados", url: "https://www.youtube.com/watch?v=OQsCRI1hzec&list=PLPDMfYZSRJ0l5AhPMK_x12MsZPRLjY2KV&index=6", category_id: 2)
  
    query = "Estrutura de dados"

    video1.save!
    video2.save!
  
    # video_search = Video.where("title LIKE ?", "%#{query}%").reload

    p video1
    p video2
  
    assert_equal 1, video_search.count
    # assert_not_nil video_search.first
    # assert_equal query, video_search.first.title
  end

  test "should update video by id" do
    video = Video.create(id: 1, title: "Trainee 2022/2 - Models no Rails", description: "Aula sobre models no Rails", url: "https://www.youtube.com/watch?v=OQsCRI1hzec&list=PLPDMfYZSRJ0l5AhPMK_x12MsZPRLjY2KV&index=6", category_id: 3)

    video.title = "Titulo atualizado"

    assert_equal "Titulo atualizado", video.title
  end

  test 'should delete video by id' do
    Video.create(title: 'Trainee 2022/2 - Models no Rails', description: 'Aula sobre models no Rails', url: 'https://www.youtube.com/watch?v=OQsCRI1hzec&list=PLPDMfYZSRJ0l5AhPMK_x12MsZPRLjY2KV&index=6', category_id: 3)
    
    video = Video.last

    assert_difference('Video.count', -1) do
      video.destroy
    end
  end   
end

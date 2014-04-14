require 'spec_helper'

describe "videos/show.html.erb" do
  let!(:video) { stub_model(Video, id: '123', title: '1st test Video') }

  before do
    create_list :comment, 2

    create :comment, video_id: '123', text: '1st test comment'
    create :comment, video_id: '123', text: '2nd test comment'

    assign(:video, video)

    render
  end

  it 'shows the video' do
    expect(rendered).to have_content '1st test Video'

    video_url = "#{Video::SITE}/videos/development/123/123"

    expect(rendered).to have_selector 'video'

    expect(rendered).to have_selector "video source[type='video/mp4'][src='#{video_url}.mp4']"

    expect(rendered).to have_selector "video source[type='video/ogg'][src='#{video_url}.ogg']"
  end

  it 'list all videos comments' do
    expect(rendered).to have_selector('.comment', count: 2)
    expect(rendered).to have_selector('.comment', text: '1st test comment')
    expect(rendered).to have_selector('.comment', text: '2nd test comment')
  end
end

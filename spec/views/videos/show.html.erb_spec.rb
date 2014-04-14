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
  end

  it 'list all videos comments' do
    expect(rendered).to have_selector('.comment', count: 2)
    expect(rendered).to have_selector('.comment', text: '1st test comment')
    expect(rendered).to have_selector('.comment', text: '2nd test comment')
  end
end

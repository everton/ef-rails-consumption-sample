require 'spec_helper'

describe "videos/index.html.erb" do
  it 'list all videos' do
    assign(:videos, [
      stub_model(Video, id: '123', title: '1st test Video', to_param: '123'),
      stub_model(Video, id: '666', title: '2nd test Video', to_param: '666')
    ])

    render

    expect(rendered).to have_selector("a[href='#{video_path('123')}']",
                                      text: '1st test Video')
  end
end

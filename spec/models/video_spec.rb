require 'spec_helper'

describe Video do
  describe :all, :vcr do
    subject(:all_videos) { Video.all }

    it { is_expected.to be_an Enumerable }

    it { expect(all_videos.size).to eq 3 }

    it 'binds each result as a Video object' do
      all_is_video = all_videos.all? { |obj| obj.is_a? Video }

      expect(all_is_video).to be_truthy
    end
  end

  describe :find, :vcr do
    subject(:video) { Video.find '1018728657' }

    it { is_expected.to be_an Video }

    it { expect(video.title).to eq "First George's Test Video" }

    # Don't use #be_truthy..
    # We need to assert that the object was properly parsed
    it { expect(video.published).to be true }
  end

  describe :comments, :vcr do
    let!(:video_comment) { create :comment, video_id: '1018728657' }
    let!(:other_comment) { create :comment }

    let(:video) { Video.find '1018728657' }

    subject(:comments) { video.comments }

    it { is_expected.to be_an Enumerable }

    it { expect(comments.size).to eq 1 }

    it { expect(comments.first).to eql video_comment }
  end

  describe :to_param do
    it 'returns stringfied version of id' do
      expect(Video.new(id: 123).to_param).to eq '123'
    end

    it 'returns nil when there is no id' do
      expect(Video.new.to_param).to be_nil
    end
  end
end

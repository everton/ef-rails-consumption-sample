module ApplicationHelper
  # TODO: video url must came from API
  def video_url_of(video, format)
    "#{Video::SITE}/videos/development/#{video.id}/#{video.id}.#{format}"
  end
end

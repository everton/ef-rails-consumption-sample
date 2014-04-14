class Video < OpenStruct
  SITE = 'http://localhost:3000'

  def self.all
    get_json('/videos').map do |attrs|
      new attrs
    end
  end

  def self.find(id)
    new get_json("/videos/#{id}")
  end

  def comments
    Comment.where(video_id: self.id)
  end

  private
  def self.get_json(path)
    uri = URI('http://localhost:3000/')
    uri.path = path

    req = Net::HTTP::Get.new(uri)
    req['ACCEPT'] = 'application/json'

    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

    JSON.parse(res.body)
  end
end

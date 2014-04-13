class Comment
  include Mongoid::Document
  field :user, type: String
  field :text, type: String
  field :video_id, type: Integer
end

class Comment
  include Mongoid::Document
  field :user, type: String
  field :text, type: String
  field :video_id, type: Integer

  validates :video_id, presence: true
  validates :user,     presence: true
  validates :text,     presence: true
end

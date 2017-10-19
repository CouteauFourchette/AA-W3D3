class TagTopic < ApplicationRecord
  has_many :taggings,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :Tagging

  has_many :urls,
    through: :taggings,
    source: :url
end

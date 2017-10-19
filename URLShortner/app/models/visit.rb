class Visit < ApplicationRecord

  belongs_to :user,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :shortened_url,
    class_name: :ShortenedUrl,
    primary_key: :id,
    foreign_key: :short_id

  def self.record_visit!(user, short_url)
    Visit.new(user_id: user.id, short_id: short_url.id).save
  end

  def count
  end
end

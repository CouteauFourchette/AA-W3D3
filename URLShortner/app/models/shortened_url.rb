class ShortenedUrl < ApplicationRecord
  validates :user_id, presence: true
  validates :long_url, presence: true
  validates :short_url, presence: true, uniqueness: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_id,
    class_name: :Visit

  has_many :taggings,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :Tagging

    def num_clicks
       visits.count
    end

    def num_uniques
      visits.select(:user_id).distinct.count
    end


    def num_recent_uniques
      recent_visits = visits.where({
        created_at: (Time.now - 10.minutes)..Time.now })

      recent_visits.select(:user_id).distinct.count
    end

    def self.random_code
      key = SecureRandom.urlsafe_base64(16)
      unless self.exists?(short_url: key)
        key = SecureRandom.urlsafe_base64(16)
      end
      key
    end

    def self.create_sh_url(user, long_url)
      random_code = self.random_code
      ShortenedUrl.new(long_url: long_url, user_id: user.id, short_url: random_code)

    end
end

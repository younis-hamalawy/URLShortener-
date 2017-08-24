class ShortenedUrl < ActiveRecord::Base
  validates :long_url, uniqueness: true, presence: true
  validates :short_url, uniqueness: true, presence: true
  validates :user_id, uniqueness: true, presence: true


  def self.random_code
    code = SecureRandom.urlsafe_base64
    # until valid_short_url(code)
    #   code = SecureRandom.urlsafe_base64
    # end
  end

  # def valid_short_url(url)
  #   ShortenedUrl.exists?(short_url: url)
  # end

  def self.create_short_url(user_id, long_url)
    ShortenedUrl.create!(
    user_id: user_id,
    long_url: long_url,
    short_url: ShortenedUrl.random_code
    )

  end
end

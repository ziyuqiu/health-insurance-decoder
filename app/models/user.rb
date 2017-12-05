class User < ApplicationRecord
  	before_save { email.downcase! }
    validate  :picture_size

    mount_uploader :picture, PictureUploader

  #has_many :registrations, class_name: "Registration",
#							 foreign_key: "user_id",
	#						 dependent: :destroy
  has_many :logs
	validates :name,  presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: false, length: { maximum: 255 },
	          format: { with: VALID_EMAIL_REGEX },
	          uniqueness: { case_sensitive: false }
	has_secure_password
  	validates :password, presence: false, length: { minimum: 6 }, allow_nil: true
    has_and_belongs_to_many :plans

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  private
	def User.digest(string)
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                  BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
	end

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end

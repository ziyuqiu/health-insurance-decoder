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
	validates :email, presence: true, length: { maximum: 255 },
	          format: { with: VALID_EMAIL_REGEX },
	          uniqueness: { case_sensitive: false }
	has_secure_password
  	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    has_and_belongs_to_many :plans
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

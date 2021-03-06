class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable

  validates :fullname,  presence: true, length: { maximum: 50 }
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :active_relationships, class_name: "Review", foreign_key: "guest_id"
  has_many :passive_relationships, class_name: "Review", foreign_key: "host_id"
  has_many :guest_reviews, through: :active_relationships,  source: :guest
  has_many :host_reviews, through: :passive_relationships, source: :host

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.fullname = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      user.skip_confirmation!
    end
  end
end
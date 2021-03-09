require 'open-uri'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook, :github]
  has_many :locations
  has_many :cities, through: :locations
  has_many :posts
  has_many :comments
  has_many :messages
  has_many :events

  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  def self.from_omniauth(access_token, omniauth_params)
    
  if omniauth_params.empty? 
    user =  where(email: access_token.info.email).first_or_create
        user.email = access_token.info.email
        user.refresh_token = access_token.credentials.refresh_token
        user.expires_at = Time.at(access_token.credentials.expires_at)
        user.access_token = access_token.credentials.token
        user.last_name = access_token.extra.id_info.family_name
        user.first_name = access_token.extra.id_info.given_name
        image = URI.open(access_token.extra.id_info.picture)
        user.photo.attach(io: image, filename: "image.jpg")
        user.password = Devise.friendly_token[0,20]
        user.username = access_token.info.email.split("@")[0]
        user.save!
    else
    data = access_token.info
    user = User.find(omniauth_params["user_id"])

       
    end 
    user
end

  def self.from_omniauth_facebook(auth)
      user =  where(email: auth.info.email).first_or_create
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name # assuming the user model has a name
      namearray = auth.info.name.split(" ")
      user.first_name = namearray[0]
      user.last_name = namearray[1]
      image = URI.open(auth.info.image)
      user.photo.attach(io: image, filename: "image.jpg")
      user.save!
      user
  end

  def self.from_omniauth_github(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.nickname # assuming the user model has a name
      namearray = auth.info.name.split(" ")
      user.first_name = namearray[0]
      user.last_name = namearray[1]
      image = URI.open(auth.info.image)
      user.photo.attach(io: image, filename: "image.jpg")
      user.github = auth.info.urls.GitHub
    
      user.save!
      user
    end
    
  end

end


# https://graph.facebook.com/#{auth.uid}/picture?type=small
# https://graph.facebook.com/3943463029040182/picture?type=small
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2] #複数追加したいとき -> %i[facebook twitter google_oauth2]

  validate :password_complexity

  mount_uploader :image, ImageUploader

  def password_complexity
    unless self.provider == "google_oauth2"
      return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/
      errors.add :password, '：1文字以上の大文字、小文字、記号を使用してください'
    end
  end

  # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[8,20]
    end
  end

  has_many :skills, through: :user_skills
  has_many :user_skills
end

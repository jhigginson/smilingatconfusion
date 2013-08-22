class User < ActiveRecord::Base
  include TheRoleUserModel
  has_many :tabs
  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.avatar = auth["info"]["image"]
    end
  end

end

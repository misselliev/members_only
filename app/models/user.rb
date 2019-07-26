# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :remember_token
  before_create :assign_token
  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true

  has_many :posts

  def new_token
    SecureRandom.urlsafe_base64
  end

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end

  def assign_token
    self.remember_token = new_token
    self.remember_digest = Digest::SHA1.hexdigest(remember_token)
  end

  def remember
    self.remember_token = new_token
    update_attribute(:remember_digest, Digest::SHA1.hexdigest(remember_token))
  end
end

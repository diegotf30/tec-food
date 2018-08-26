class User < ApplicationRecord
  has_many :purchases

  devise :database_authenticatable, :validatable, :registerable, 
         :recoverable, :rememberable, :confirmable

  validates :name, length: { maximum: 50 }, allow_blank: true
  validates :gender, inclusion: ['male', 'female'], allow_blank: true, allow_nil: true

  def verify
    update(confirmed_at: Time.current)
  end

  def verified?
    !!confirmed_at
  end
end

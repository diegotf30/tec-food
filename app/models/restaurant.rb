class Restaurant < ApplicationRecord
  has_many :products
  has_many :users, through: :purchases

  DAYS = %w(mon tue wes thu fri sat sun all)

  validates :name, length: { maximum: 50 }
  validate :active_days_valid
  validate :restaurant_schedule_has_time_format

  private

  def restaurant_schedule_has_time_format
    begin
      Time.parse(opening_hour)
    rescue
      errors.add(:opening_hour, 'is not an hour, use "HH:mm" format')
    end

    begin
      Time.parse(closing_hour)
    rescue
      errors.add(:closing_hour, 'is not an hour, use "HH:mm" format')
    end
  end

  def active_days_valid
    invalid_days = active_days - DAYS
    errors.add(:active_days, "#{invalid_days} no son dias de la semana") unless invalid_days.empty?
  end
end

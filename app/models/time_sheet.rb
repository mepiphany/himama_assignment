class TimeSheet < ApplicationRecord
  belongs_to :user

  validate :clock_in_date_cannot_be_from_the_past
  validate :clock_in_date_cannot_be_after_clock_out_date

  validate :clock_out_date_cannot_be_from_the_past
  validate :clock_out_date_cannot_be_before_clock_in_date

  def clock_in_date_cannot_be_from_the_past
    if clock_in.present? && clock_in < Date.today
      errors.add(:clock_in, "can't be in the past")
    end
  end

  def clock_in_date_cannot_be_after_clock_out_date
    if (clock_out.present? && clock_in.present?) && clock_in > clock_out  
      errors.add(:clock_in, "can't be after clock out date")
    end
  end

  def clock_out_date_cannot_be_from_the_past
    if clock_out.present? && clock_out < Date.today
      errors.add(:clock_out, "can't be in the past")
    end
  end

  def clock_out_date_cannot_be_before_clock_in_date
    if (clock_out.present? && clock_in.present?) && clock_out < clock_in 
      errors.add(:clock_out, "can't be after clock out date")
    end
  end
end

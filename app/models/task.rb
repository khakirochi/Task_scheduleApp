class Task < ApplicationRecord
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :is_end_date_after_today
  
  
  def is_end_date_after_today
    errors.add(:end_date, 'は今日より後の日付を指定してください') if end_date.nil? || end_date <= Date.today 
  end
end

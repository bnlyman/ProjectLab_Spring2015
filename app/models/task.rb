class Task < ActiveRecord::Base
  belongs_to :project

  validates :name, presence: true
  validates :description, presence: true
  validate :past_due

  def past_due
    if due_date <= Time.now
      errors.add(:due_date, "nothing in the past please")
    end
  end
end

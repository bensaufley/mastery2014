class Activity < ActiveRecord::Base
  self.inheritance_column = nil
  TYPES = %w(Timed Counted)

  validates :name, presence: true
  validates :type, inclusion: { in: TYPES }
  validates :name, uniqueness: { scope: :type, message: 'has already been taken for this type of activity' }

  has_and_belongs_to_many :users, join_table: :user_activities

  def name=(name)
    write_attribute(:name, name.try(:strip))
  end

  def description=(description)
    write_attribute(:description, description.try(:strip))
  end
end

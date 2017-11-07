class Paper < ActiveRecord::Base
  belongs_to :author
  validates :title, :venue, :year, presence: true
end

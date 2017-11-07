class Paper < ActiveRecord::Base
  belongs_to :author
  validates :title, :venue, presence: true
end

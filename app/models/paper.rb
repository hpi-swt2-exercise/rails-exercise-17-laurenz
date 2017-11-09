class Paper < ActiveRecord::Base
    scope :year_until, ->(time) { where("year <= ?", time) }
    has_and_belongs_to_many :authors
    validates :title, :venue, :year, presence: true
    validates :year, numericality: { only_integer: true }
end

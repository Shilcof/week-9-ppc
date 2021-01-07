class Supply < ApplicationRecord
    has_many :parties_supplies
    has_many :parties, through: :parties_supplies
end

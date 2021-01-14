class Supply < ApplicationRecord
    has_many :parties_supplies
    has_many :parties, through: :parties_supplies 

    scope :three_most_used, -> {joins(:parties_supplies).group(:id).order(Arel.sql("COUNT(supply_id) DESC")).limit(3)}
    scope :alphabetise, -> {order(:name)}
end




# left_joins(:supplies).group(:id).order(Arel.sql("COUNT(supply_id)"))
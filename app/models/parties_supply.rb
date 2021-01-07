class PartiesSupply < ApplicationRecord
  belongs_to :party
  belongs_to :supply

  def supply_attributes=(supply_attributes)
    if supply_attributes[:name].present?
      self.supply = Supply.find_or_create_by(supply_attributes)
    end 
  end

end

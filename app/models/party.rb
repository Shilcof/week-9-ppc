class Party < ApplicationRecord
    belongs_to :category

    has_many :parties_supplies
    has_many :supplies, -> {alphabetise}, through: :parties_supplies

    accepts_nested_attributes_for :parties_supplies, reject_if: proc {|parties_supplies| parties_supplies[:quantity].blank?}

    def private?
        self.private ? 'Private' : 'Public'
    end    

    def category_attributes=(category_attributes)
        if category_attributes[:name].present?
            self.category = Category.find_or_create_by(category_attributes)
        end 
    end

    # def self.search(query)
    #     where("LOWER(name) LIKE LOWER(?)", "%#{query}%")
    # end

    scope :search, -> (query){where("LOWER(name) LIKE LOWER(?)", "%#{query}%")}

    scope :supply_sort, -> {left_joins(:supplies).group(:id).order(Arel.sql("COUNT(supply_id)"))}
    scope :alphabetise, -> {order(:name)}
end

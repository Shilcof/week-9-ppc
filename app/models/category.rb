class Category < ApplicationRecord
    has_many :private_parties, -> {private_parties}, class_name: 'Party'
    has_many :public_parties, -> {public_parties}, class_name: 'Party'
    has_many :parties
end

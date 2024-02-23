class Property < ApplicationRecord
    validates :title, presence: true
    validates :rent, presence: true
    validates :administration, presence: true
end

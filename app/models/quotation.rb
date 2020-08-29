class Quotation < ApplicationRecord
    validates :quote, presence: true, length: { minimum: 6, maximum: 300 }

    belongs_to :creator
end

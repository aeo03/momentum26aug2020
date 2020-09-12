class Quotation < ApplicationRecord
    validates :quote, presence: true, length: { minimum: 6, maximum: 300 }

    belongs_to :creator

    has_many :quotation_tags, dependent: :destroy
    has_many :tags, through: :quotation_tags

end

class QuotationTag < ApplicationRecord
    # validates :tag_id, presence: true
    # validates :quotation_id, presence: true

    belongs_to :quotation
    belongs_to :tag
end

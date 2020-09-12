class QuotationTag < ApplicationRecord

    belongs_to :quotation
    belongs_to :tag
end

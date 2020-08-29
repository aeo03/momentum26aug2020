class Creator < ApplicationRecord
    validates :author, presence: true, length: { minimum: 6, maximum: 300 }

    has_many :quotations
end

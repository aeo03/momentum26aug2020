class Tag < ApplicationRecord
    validates :tag_name, presence: true, length: { minimum: 2}, uniqueness: true

    has_many :quotation_tag, dependent: :destroy
    has_many :quotation, through: :quotation_tag

end

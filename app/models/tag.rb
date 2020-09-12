class Tag < ApplicationRecord
    validates :tag_name, presence: true, length: { minimum: 2}, uniqueness: true

    has_many :quotation_tags, dependent: :destroy #plural pag has any
    has_many :quotations, through: :quotation_tags

end

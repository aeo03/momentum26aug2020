class CreateQuotationTags < ActiveRecord::Migration[6.0]
  def change
    create_table :quotation_tags do |t|
      t.integer :quotation_id
      t.integer :tag_id
      t.timestamps
    end
  end
end

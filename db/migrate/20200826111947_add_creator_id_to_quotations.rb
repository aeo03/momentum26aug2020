class AddCreatorIdToQuotations < ActiveRecord::Migration[6.0]
  def change
    add_column :quotations, :creator_id, :int
  end
end

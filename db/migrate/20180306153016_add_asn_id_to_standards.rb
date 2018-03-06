class AddAsnIdToStandards < ActiveRecord::Migration[5.1]
  def change
    add_column :standards, :asn_id, :string
  end
end

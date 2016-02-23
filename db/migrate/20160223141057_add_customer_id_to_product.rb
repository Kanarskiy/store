class AddCustomerIdToProduct < ActiveRecord::Migration
    def change
        add_column :products, :customer_id, :integer

        add_index :products, :customer_id
    end
end

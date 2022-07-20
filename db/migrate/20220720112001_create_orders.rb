class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references   :merchant
      t.references   :shopper
      t.float        :amount
      t.float        :disburs_fee
      t.datetime     :completed_at

      t.timestamps
    end
  end
end

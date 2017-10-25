class AddPhoneNumberToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phoneNumber, :string
  end
end

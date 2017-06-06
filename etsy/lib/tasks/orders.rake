namespace :orders do
  desc 'Update Paid value for exisiting Orders that arent set to true or false'
  task update_paid: :environment do
    Order.where(paid: nil).update_all(paid: false)
  end
end

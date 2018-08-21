class CreateBlackCards < ActiveRecord::Migration[5.1]
  def change
    create_table :black_cards do |t|
      t.text :title

      t.timestamps
    end
  end
end

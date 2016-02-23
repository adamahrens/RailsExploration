class AddDocumentToWorks < ActiveRecord::Migration
  def change
    add_column :works, :document, :string
  end
end

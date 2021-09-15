class RemoveOpinionFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :opinion, :string
  end
end

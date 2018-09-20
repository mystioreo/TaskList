class ChangeCompletionDate < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :completion_date, :date
  end
end

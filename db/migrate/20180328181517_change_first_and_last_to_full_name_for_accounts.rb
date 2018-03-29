class ChangeFirstAndLastToFullNameForAccounts < ActiveRecord::Migration[5.1]
  def up
    remove_column :accounts, :first
    remove_column :accounts, :last
    add_column :accounts, :full_name, :string
  end

  def down
    remove_column :accounts, :full_name
    add_column :accounts, :first, :string
    add_column :accounts, :last, :string
  end
end

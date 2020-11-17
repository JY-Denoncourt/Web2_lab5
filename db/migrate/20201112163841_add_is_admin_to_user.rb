#Jean-Yves Denoncourt 9977949 2020-11-12

class AddIsAdminToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_admin, :boolean, default: false
  end
end

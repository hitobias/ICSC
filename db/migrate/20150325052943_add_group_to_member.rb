class AddGroupToMember < ActiveRecord::Migration
  def change
    add_reference :members, :group, index: true
    add_foreign_key :members, :groups
  end
end

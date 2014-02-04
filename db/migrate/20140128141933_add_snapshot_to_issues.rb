class AddSnapshotToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :snapshot, :string
  end
end

class AddPositionToUpcomingProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :upcoming_projects, :position, :integer
  end
end

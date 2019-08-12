class ChangeDescriptionOnUpcomingProjectsToText < ActiveRecord::Migration[5.1]
  def change
    change_column :upcoming_projects, :description, :text
  end
end

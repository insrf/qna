class AddAuthorIdInQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :author_id, :integer, null: false
  end
end

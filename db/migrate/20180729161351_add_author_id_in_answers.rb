class AddAuthorIdInAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :author_id, :integer, null: false
  end
end

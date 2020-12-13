class AddDocumentsToExams < ActiveRecord::Migration[6.0]
  def change
    add_column :exams, :documents, :json
  end
end

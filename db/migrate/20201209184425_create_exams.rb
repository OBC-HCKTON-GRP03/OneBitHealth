# frozen_string_literal: true

class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :establishment_name, null: false
      t.date :exam_date, null: false
      t.belongs_to :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end

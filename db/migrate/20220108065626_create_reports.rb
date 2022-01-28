# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.text :title, null: false
      t.text :report_content, null: false
      t.references :user_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end

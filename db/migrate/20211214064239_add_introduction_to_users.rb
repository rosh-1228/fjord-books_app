# frozen_string_literal: true

class AddIntroductionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :Introduction, :text
  end
end

class AddConferenceToConferenceOption < ActiveRecord::Migration
  def change
  	add_reference :conference_options, :conference, index: true
    add_foreign_key :conference_options, :conferences
  end
end

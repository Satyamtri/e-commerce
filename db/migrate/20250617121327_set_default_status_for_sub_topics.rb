class SetDefaultStatusForSubTopics < ActiveRecord::Migration[7.0]
  def change
    change_column_default :sub_topics, :status, default: false
  end
end

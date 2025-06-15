class SubTopic < ApplicationRecord
  belongs_to :topic

  def status_text
    status ? 'Done' : 'Pending'
  end
end

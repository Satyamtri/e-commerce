class Topic < ApplicationRecord
  has_many :sub_topics, dependent: :destroy
end

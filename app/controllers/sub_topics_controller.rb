class SubTopicsController < ApplicationController
  before_action :set_sub_topic, only: %i[ update_status ]

  def index
    @sub_topics = SubTopic.all
  end

  def update_status
    @sub_topic.update!(status: !@sub_topic.status)
    @topic = @sub_topic.topic
    @topic.update(status: @topic.sub_topics.all?(&:status))
    
    render json: { 
      new_status: @sub_topic.status_text,
      topic_status: @topic.status,
      topic_id: @topic.id
    }
  end

  private

  def set_sub_topic
    @sub_topic = SubTopic.find(params[:id])
  end
end
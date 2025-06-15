class TopicsController < ApplicationController
  before_action :set_topic, only: %i[ show ]

  def index
    @topics = Topic.all
  end

  def show
    @sub_topics = @topic.sub_topics
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])  
  end

  def topic_params
    params.require(:topic).permit(:name)
  end
end
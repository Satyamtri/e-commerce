class TopicsController < ApplicationController
  before_action :set_topic, only: %i[ show ]

  def index
    @topics = Topic.all
  end

  def show
    @sub_topics = @topic.sub_topics
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      format.json { render json: @topic, success: :true, message: "Topic created successfully" }
    else
      format.json { render json: @topic.errors, status: :unprocessable_entity }
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])  
  end

  def topic_params
    params.require(:topic).permit(:name)
  end
end
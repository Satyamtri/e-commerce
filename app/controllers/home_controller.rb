class HomeController < ApplicationController
  def index
  end
  
  def progress
    @topics = Topic.all
    @overall_progress = calculate_overall_progress
  end

  private

  def calculate_overall_progress
    levels = ['EASY', 'MEDIUM', 'HARD']
    progress = {}

    levels.each do |level|
      subtopics = SubTopic.where(level: level.downcase)
      total = subtopics.count
      completed = subtopics.where(status: true).count
      percentage = total.positive? ? (completed.to_f / total * 100).round : 0

      progress[level.downcase.to_sym] = {
        total: total,
        completed: completed,
        percentage: percentage
      }
    end

    progress
  end
end
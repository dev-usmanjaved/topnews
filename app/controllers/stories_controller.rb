# frozen_string_literal: true

class StoriesController < ApplicationController
  before_action :set_story_id, only: %i[like unlike show]

  def index
    data = StoryService.fetch_stories
    details = StoryService.fetch_stories_details(data)
    if data.blank?
      flash.now[:alert] = 'Something went wrong'
    else
      @stories = details
    end
  end

  def show
    data = StoryService.fetch_story(@story_id)
    if data.blank?
      flash.now[:alert] = 'Something went wrong'
    else
      @story = data
      @is_liked = current_user.likes.find_by(story_id: @story_id).present?
      @liked_by = Like.includes(:user).where(story_id: @story_id).map(&:user)
    end
  end

  def liked_stories
    @data =  Like.distinct.all.paginate(page: params[:page], per_page: 10)
    @stories = StoryService.fetch_stories_details(@data.pluck(:story_id).uniq)
  end

  def like
    current_user.likes.create(story_id: @story_id)
  end

  def unlike
    current_user.likes.find_by(story_id: @story_id)&.delete
  end

  private

  def set_story_id
    @story_id = params[:id]
  end
end

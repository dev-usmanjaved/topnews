# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StoryService, type: :service do
  describe '.fetch_stories' do
    it 'fetch all stories' do
      expect(described_class.fetch_stories).not_to be_nil
    end
  end

  describe '.fetch_story' do
    it 'fetch story details' do
      story_id = described_class.fetch_stories[0]
      story = described_class.fetch_story(story_id)
      expect(story).not_to be_nil
      expect(story.keys).to include('by', 'id', 'title', 'url')
    end
  end
end

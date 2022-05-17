# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StoriesController, type: :controller do
  context 'stories' do
    let!(:story_ids) { StoryService.fetch_stories }
    let!(:story_id) { story_ids.first }
    let!(:user) { create(:user) }

    before do
      sign_in(user)
      @request.session['verify_token'] = 'temp_token'
    end

    describe 'Post #like' do
      subject { post :like, params: { id: story_id }, as: :js }

      it 'Like increase by one' do
        expect { subject }.to change { Like.count }.by(1)
      end
    end

    describe 'Delete #unlike' do
      subject { delete :unlike, params: { id: story_id }, as: :js }

      it 'Like decrease by one' do
        post :like, params: { id: story_id }, as: :js
        expect { subject }.to change { Like.count }.by(-1)
      end
    end
  end
end

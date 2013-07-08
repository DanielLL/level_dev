require 'spec_helper'
include Devise::TestHelpers

describe SkillsController do

  context 'logged user as a developer' do

    before(:each) do
      @category = FactoryGirl.create(:category)
      @developer = FactoryGirl.create(:developer)
      sign_in @developer
    end

    context 'index' do
      it 'should get 200 code' do
        get :index, category_id: @category.id
        response.should be_success
      end
    end

    context 'new' do
      it 'should redirect to index page' do
        get :new, category_id: @category.id
        response.should_not be_success
      end
    end

    context 'edit' do
      it 'should get 200 code' do
        skill = FactoryGirl.create(:skill, category_id: @category.id)
        get :edit, category_id: @category.id, id: skill.id
        response.should_not be_success
      end
    end
  end

  context 'logged user as a admin' do

    before(:each) do
      @category = FactoryGirl.create(:category)
      @developer = FactoryGirl.create(:developer, admin: true)
      sign_in @developer
    end

    context 'new' do
      it 'should render template new' do
        get :new, category_id: @category.id
        response.should be_success
      end
    end

    context 'edit' do
      it 'should render template new' do
        skill = FactoryGirl.create(:skill)
        get :new, category_id: @category.id, id: skill.id
        response.should be_success
      end
    end

    context 'destroy' do
      it 'should delete a skill' do
        skill = FactoryGirl.create(:skill, category_id: @category.id)
        delete :destroy, category_id: @category.id, id: skill.id
        response.should redirect_to category_path(skill.category)
      end
    end
  end
end

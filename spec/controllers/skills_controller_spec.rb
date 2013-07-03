require 'spec_helper'

describe SkillsController do

  before(:each) do
    @category = FactoryGirl.create(:category)
  end

  context 'index' do
    it 'should get 200 code' do
      get :index, category_id: @category.id
      response.should be_success
    end
  end

  context 'new' do
    it 'should get 200 code' do
      get :new, category_id: @category.id
      response.should be_success
    end
  end

  context 'edit' do
    skill = FactoryGirl.create(:skill)
    it 'should get 200 code' do
      get :edit, category_id: @category.id, id: skill.id
      response.should be_success
    end
  end

end

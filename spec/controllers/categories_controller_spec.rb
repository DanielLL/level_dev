require 'spec_helper'

describe CategoriesController do

  context 'index' do
    it 'should get 200 code' do
      get :index
      response.should be_success
    end
  end

  context 'show' do
    it 'should get 200 code' do
      category = FactoryGirl.create(:category)
      get :show, id: category.id
      response.should be_success
    end
  end

  context 'new' do
    it 'should get 200 code' do
      get :new
      response.should be_success
    end
  end

  context 'edit' do
    it 'should get 200 code' do
      category = FactoryGirl.create(:category)
      get :edit, id: category.id
      response.should be_success
    end
  end
end

require 'spec_helper'
include Devise::TestHelpers

describe CategoriesController do

  context 'logged user as a developer' do

    before(:each) do
      @developer = FactoryGirl.create(:developer)
      sign_in @developer
    end

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
      it 'should redirect to index page' do
        get :new
        response.should_not be_success
      end
    end

    context 'edit' do
      it 'should redirect to index page' do
        category = FactoryGirl.create(:category)
        get :edit, id: category.id
        response.should_not be_success
      end
    end
  end

  context 'logged user as a admin' do

    before(:each) do
      @developer = FactoryGirl.create(:developer, admin: true)
      sign_in @developer
    end

    context 'new' do
      it 'should render template new' do
        get :new
        response.should be_success
      end
    end

    context 'edit' do
      it 'should render template edit' do
        category = FactoryGirl.create(:category)
        get :edit, id: category.id
        response.should be_success
      end
    end

    context 'destroy' do
      it 'should delete a category' do
        category = FactoryGirl.create(:category)
        delete :destroy, id: category.id
        response.should redirect_to categories_path
      end
    end
  end
end

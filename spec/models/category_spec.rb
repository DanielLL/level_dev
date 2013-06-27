require 'spec_helper'

describe Category do

  before :each do 
    @category = FactoryGirl.create(:category)
  end

  context 'with valid information' do
    it 'should be saved' do
      @category.save.should be_true
    end
  end

  context 'with invalid information' do
    it 'price isnt numeric' do
      @category.percentage = 'aaa'
      @category.save.should be_false
    end
    it 'description is blank' do
      @category.percentage = ''
      @category.save.should be_false
    end
  end
end

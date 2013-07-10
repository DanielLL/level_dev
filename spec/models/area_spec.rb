require 'spec_helper'

describe Area do

  before :each do 
    @area = FactoryGirl.create(:area)
  end

  context 'with valid information' do
    it 'should be saved' do
      @area.save.should be_true
    end
  end

  context 'with invalid information' do
    it 'price isnt numeric' do
      @area.percentage = 'aaa'
      @area.save.should be_false
    end
    it 'description is blank' do
      @area.percentage = ''
      @area.save.should be_false
    end
    it 'percentage exed 100' do
      @area.save
      area = FactoryGirl.create(:area, percentage: 100)
      area.valid_percentage?.should be_true
    end
  end
end

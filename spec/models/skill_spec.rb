require 'spec_helper'

describe Skill do

  before :each do 
    @category = FactoryGirl.create(:category)
    @skill = FactoryGirl.create(:skill, category_id: @category.id)
  end

  context 'with valid information' do
    it 'should be saved' do
      @skill.save.should be_true
    end
  end

  context 'with invalid information' do
    it 'name is blank' do
      @skill.name = ''
      @skill.save.should be_false
    end
  end
end

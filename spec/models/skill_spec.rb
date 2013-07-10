require 'spec_helper'

describe Skill do

  before :each do 
    @area = FactoryGirl.create(:area)
    @skill = FactoryGirl.create(:skill, area_id: @area.id)
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

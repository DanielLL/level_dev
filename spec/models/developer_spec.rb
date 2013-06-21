require 'spec_helper'

describe Developer do
  context 'a valid Developer' do
    let!(:developer) {Developer.new(name: "Test", email: "test@test.com", password: "123tamarindo" )}
    it "should saved correctly" do
      developer.save
      developer.errors.messages.should == {}
      Developer.first.should == developer
    end
  end

  context 'an invalid Developer' do
    let!(:developer) {Developer.new}
    it "should saved correctly" do
      developer.save
      developer.errors.messages.should == {:email=>["can't be blank"], :password=>["can't be blank"], :name=>["can't be blank"]}
      Developer.count.should == 0
    end
  end
end

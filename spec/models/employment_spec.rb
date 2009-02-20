require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Employment do
  before(:each) do
    @valid_attributes = {
      :person_id => 1,
      :place_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Employment.create!(@valid_attributes)
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Place do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description",
      :street-address => "value for street-address",
      :extended-address => "value for extended-address",
      :email => "value for email",
      :phone => "value for phone",
      :zip => "value for zip",
      :city => "value for city",
      :web-address => "value for web-address",
      :mixer => "value for mixer",
      :pa_system => "value for pa_system",
      :monitor_system => "value for monitor_system",
      :monitor_mixer => "value for monitor_mixer",
      :outboard => "value for outboard"
    }
  end

  it "should create a new instance given valid attributes" do
    Place.create!(@valid_attributes)
  end
end

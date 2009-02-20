require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/places/index.html.erb" do
  include PlacesHelper
  
  before(:each) do
    assigns[:places] = [
      stub_model(Place,
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
      ),
      stub_model(Place,
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
      )
    ]
  end

  it "should render list of places" do
    render "/places/index.html.erb"
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", "value for street-address".to_s, 2)
    response.should have_tag("tr>td", "value for extended-address".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for phone".to_s, 2)
    response.should have_tag("tr>td", "value for zip".to_s, 2)
    response.should have_tag("tr>td", "value for city".to_s, 2)
    response.should have_tag("tr>td", "value for web-address".to_s, 2)
    response.should have_tag("tr>td", "value for mixer".to_s, 2)
    response.should have_tag("tr>td", "value for pa_system".to_s, 2)
    response.should have_tag("tr>td", "value for monitor_system".to_s, 2)
    response.should have_tag("tr>td", "value for monitor_mixer".to_s, 2)
    response.should have_tag("tr>td", "value for outboard".to_s, 2)
  end
end


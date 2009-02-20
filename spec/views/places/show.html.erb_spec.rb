require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/places/show.html.erb" do
  include PlacesHelper
  before(:each) do
    assigns[:place] = @place = stub_model(Place,
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
  end

  it "should render attributes in <p>" do
    render "/places/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/value\ for\ street\-address/)
    response.should have_text(/value\ for\ extended\-address/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ phone/)
    response.should have_text(/value\ for\ zip/)
    response.should have_text(/value\ for\ city/)
    response.should have_text(/value\ for\ web\-address/)
    response.should have_text(/value\ for\ mixer/)
    response.should have_text(/value\ for\ pa_system/)
    response.should have_text(/value\ for\ monitor_system/)
    response.should have_text(/value\ for\ monitor_mixer/)
    response.should have_text(/value\ for\ outboard/)
  end
end


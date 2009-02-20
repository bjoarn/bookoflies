require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/places/edit.html.erb" do
  include PlacesHelper
  
  before(:each) do
    assigns[:place] = @place = stub_model(Place,
      :new_record? => false,
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

  it "should render edit form" do
    render "/places/edit.html.erb"
    
    response.should have_tag("form[action=#{place_path(@place)}][method=post]") do
      with_tag('input#place_name[name=?]', "place[name]")
      with_tag('textarea#place_description[name=?]', "place[description]")
      with_tag('input#place_street-address[name=?]', "place[street-address]")
      with_tag('input#place_extended-address[name=?]', "place[extended-address]")
      with_tag('input#place_email[name=?]', "place[email]")
      with_tag('input#place_phone[name=?]', "place[phone]")
      with_tag('input#place_zip[name=?]', "place[zip]")
      with_tag('input#place_city[name=?]', "place[city]")
      with_tag('input#place_web-address[name=?]', "place[web-address]")
      with_tag('input#place_mixer[name=?]', "place[mixer]")
      with_tag('input#place_pa_system[name=?]', "place[pa_system]")
      with_tag('input#place_monitor_system[name=?]', "place[monitor_system]")
      with_tag('input#place_monitor_mixer[name=?]', "place[monitor_mixer]")
      with_tag('textarea#place_outboard[name=?]', "place[outboard]")
    end
  end
end



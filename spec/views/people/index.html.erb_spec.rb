require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/people/index.html.erb" do
  include PeopleHelper
  
  before(:each) do
    assigns[:people] = [
      stub_model(Person,
        :name => "value for name",
        :email => "value for email",
        :phone => "value for phone",
        :password_hash => "value for password_hash"
      ),
      stub_model(Person,
        :name => "value for name",
        :email => "value for email",
        :phone => "value for phone",
        :password_hash => "value for password_hash"
      )
    ]
  end

  it "should render list of people" do
    render "/people/index.html.erb"
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for phone".to_s, 2)
    response.should have_tag("tr>td", "value for password_hash".to_s, 2)
  end
end


require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/people/show.html.erb" do
  include PeopleHelper
  before(:each) do
    assigns[:person] = @person = stub_model(Person,
      :name => "value for name",
      :email => "value for email",
      :phone => "value for phone",
      :password_hash => "value for password_hash"
    )
  end

  it "should render attributes in <p>" do
    render "/people/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ phone/)
    response.should have_text(/value\ for\ password_hash/)
  end
end


require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/people/new.html.erb" do
  include PeopleHelper
  
  before(:each) do
    assigns[:person] = stub_model(Person,
      :new_record? => true,
      :name => "value for name",
      :email => "value for email",
      :phone => "value for phone",
      :password_hash => "value for password_hash"
    )
  end

  it "should render new form" do
    render "/people/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", people_path) do
      with_tag("input#person_name[name=?]", "person[name]")
      with_tag("input#person_email[name=?]", "person[email]")
      with_tag("input#person_phone[name=?]", "person[phone]")
      with_tag("input#person_password_hash[name=?]", "person[password_hash]")
    end
  end
end



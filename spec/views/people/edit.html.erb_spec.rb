require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/people/edit.html.erb" do
  include PeopleHelper
  
  before(:each) do
    assigns[:person] = @person = stub_model(Person,
      :new_record? => false,
      :name => "value for name",
      :email => "value for email",
      :phone => "value for phone",
      :password_hash => "value for password_hash"
    )
  end

  it "should render edit form" do
    render "/people/edit.html.erb"
    
    response.should have_tag("form[action=#{person_path(@person)}][method=post]") do
      with_tag('input#person_name[name=?]', "person[name]")
      with_tag('input#person_email[name=?]', "person[email]")
      with_tag('input#person_phone[name=?]', "person[phone]")
      with_tag('input#person_password_hash[name=?]', "person[password_hash]")
    end
  end
end



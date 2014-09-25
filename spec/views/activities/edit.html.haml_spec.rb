require 'rails_helper'

RSpec.describe "activities/edit", :type => :view do
  before(:each) do
    @activity = assign(:activity, Activity.create!(
      :name => "MyString",
      :description => "MyText",
      :type => ""
    ))
  end

  it "renders the edit activity form" do
    render

    assert_select "form[action=?][method=?]", activity_path(@activity), "post" do

      assert_select "input#activity_name[name=?]", "activity[name]"

      assert_select "textarea#activity_description[name=?]", "activity[description]"

      assert_select "input#activity_type[name=?]", "activity[type]"
    end
  end
end

require 'rails_helper'

RSpec.describe "triggers/new", type: :view do
  before(:each) do
    assign(:trigger, Trigger.new(
      :name => "MyString",
      :description => "MyString",
      :emailSubject => "MyString",
      :emailContent => "MyString",
      :num_times_triggered => 1,
      :num_emails_sent => 1,
      :delayTime => 1
    ))
  end

  it "renders new trigger form" do
    render

    assert_select "form[action=?][method=?]", triggers_path, "post" do

      assert_select "input#trigger_name[name=?]", "trigger[name]"

      assert_select "input#trigger_description[name=?]", "trigger[description]"

      assert_select "input#trigger_emailSubject[name=?]", "trigger[emailSubject]"

      assert_select "input#trigger_emailContent[name=?]", "trigger[emailContent]"

      assert_select "input#trigger_num_times_triggered[name=?]", "trigger[num_times_triggered]"

      assert_select "input#trigger_num_emails_sent[name=?]", "trigger[num_emails_sent]"

      assert_select "input#trigger_delayTime[name=?]", "trigger[delayTime]"
    end
  end
end

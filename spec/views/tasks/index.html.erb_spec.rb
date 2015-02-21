require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        :description => "Description",
        :time_estimate => 1
      ),
      Task.create!(
        :description => "Description",
        :time_estimate => 1
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

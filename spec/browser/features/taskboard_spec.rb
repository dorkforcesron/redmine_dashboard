require "spec_helper"

describe "Taskboard", :js => true, :sauce => true do
  fixtures :projects, :projects_trackers, :users, :members,
    :member_roles, :issues, :issue_categories,
    :issue_statuses, :enumerations, :roles, :time_entries,
    :versions, :workflows

  let(:project) { Project.find 'ecookbook' }

  before do
    set_permissions
    enable_plugin project
    login_as 'dlopper', 'foo'
  end

  it "should redirect to taskboard" do
    visit '/projects/ecookbook'

    within '#main-menu' do
      click_on 'Dashboards'
    end

    expect(current_path).to eq '/dashboards/1'
  end
end
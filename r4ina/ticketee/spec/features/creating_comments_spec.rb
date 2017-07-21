require "rails_helper"
# to be noted that have_content is not a existing method
# but RSpec would translate it to has_content?, a method defined
# in Capybara
RSpec.feature "Users can comment on tickets" do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project) }
  let(:ticket) { FactoryGirl.create(:ticket, project: project, author: user) }

  before do
    login_as(user)
    assign_role!(user, :manager, project)
  end

  scenario "with valid attributes" do
    visit project_ticket_path(project, ticket)
    fill_in "Text", with: "Added a comment!"
    click_button "Create Comment"

    expect(page).to have_content "Comment has been created."
    within("#comments") do
      expect(page).to have_content "Added a comment!"
    end
  end

  scenario 'with invalid attributes' do
    visit project_ticket_path(project, ticket)
    click_button "Create Comment"

    expect(page).to have_content "Comment has not been created."
  end
end

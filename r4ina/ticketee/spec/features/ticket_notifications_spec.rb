require "rails_helper"

RSpec.feature 'users can receive notifications about tickets' do
  let(:alice) { FactoryGirl.create(:user, email: "alice@example.com") }
  let(:bob) { FactoryGirl.create(:user, email: "bob@example.com") }
  let(:project) { FactoryGirl.create(:project) }
  let(:ticket) do
    FactoryGirl.create(:ticket, project: project, author: alice)
  end

  before do
    assign_role!(alice, :manager, project)
    assign_role!(bob, :manager, project)

    login_as(bob)
    visit project_ticket_path(project, ticket)
  end

  scenario 'ticket authors automatically receive notifications' do
    fill_in "Text", with: "Is it out yet?"
    click_button "Create Comment"

    # find most recent mail sent to alice
    email = find_email!(alice.email) # find_email! is from Emai Spec gem
    expected_subject = "[ticketee] #{project.name} - #{ticket.name}"
    expect(email.subject).to eq expected_subject

    click_first_link_in_email(email)
    expect(current_path).to eq project_ticket_path(project, ticket)
  end
end
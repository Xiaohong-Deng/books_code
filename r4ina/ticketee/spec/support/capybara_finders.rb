module CapybaraFinders
  def list_item(content)
    # ul is not an action link, but what is action link?
    find("ul:not(.actions) li", text: content)
  end
end

RSpec.configure do |c|
  c.include CapybaraFinders, type: :feature
end

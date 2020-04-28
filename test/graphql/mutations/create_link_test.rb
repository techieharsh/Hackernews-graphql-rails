require 'test_helper'

class Mutations::CreateLinkTest < ActiveSupport::TestCase
	def perform(user: nil, **args)
    Mutations::CreateLink.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test "Create a new link" do
  	link = perform(url: 'http://xyz.com', description: 'We are perform unit test.',)
  	
  	assert link.persisted?
    assert_equal link.description, 'We are perform unit test.'
    assert_equal link.url, 'http://xyz.com'
  end
end

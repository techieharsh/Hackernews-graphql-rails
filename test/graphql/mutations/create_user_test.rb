require 'test_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Mutations::CreateUser.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test 'Create new user' do 
    user = perform(
      name: 'Test User',
      auth_provider: {
        credentials: {
          email: 'harvesh@example.com',
          password: '[omitted]'
        }
      }
    )
    
    assert user.persisted?
    assert_equal user.name, 'Test User'
    assert_equal user.email, 'harvesh@example.com'
  end
end
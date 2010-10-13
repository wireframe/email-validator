require File.join(File.dirname(__FILE__), 'helper')

ActiveRecord::Schema.define(:version => 1) do
  create_table :users, :force => true do |t|
    t.column :email, :string
  end
end

class TestEmailValidator < Test::Unit::TestCase
  class User < ActiveRecord::Base
    validate_email_format :email
  end
  
  context "object with invalid email address" do
    setup do
      @user = User.create :email => 'mike@@@@@test.com'
    end
    should 'have error on email attribute' do
      assert_equal 'Email is invalid', @user.errors.full_messages.to_sentence
    end
  end
  context "object with email address containing double quotes" do
    setup do
      @user = User.create :email => '"mike" foo@test.com'
    end
    should 'have not error on email attribute' do
      assert_equal 'Email is invalid', @user.errors.full_messages.to_sentence
    end
  end

  context "object with valid email address" do
    setup do
      @user = User.create :email => 'foo@test.com'
    end
    should 'have not error on email attribute' do
      assert @user.valid?, @user.errors.full_messages.to_sentence
    end
  end
end

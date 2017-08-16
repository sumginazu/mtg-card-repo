require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: 'test_user0', name: 'Test User', email: 'test0@example.com',
                     password: 'foobar', password_confirmation: 'foobar')
  end

  test 'should be valid' do
    a = @user.dup
    assert a.valid?
  end

  test 'should be nonempty' do
    a = @user.dup
    a.username = '          '
    assert_not a.valid?
    b = @user.dup
    b.name = '              '
    assert_not b.valid?
    c = @user.dup
    c.email = '             '
    assert_not c.valid?
  end

  test 'should have capped length' do
    a = @user.dup
    a.username = 'a'*21
    assert_not a.valid?
    b = @user.dup
    b.name = 'a'*101
    assert_not b.valid?
    c = @user.dup
    c.email = 'a'*244 + '@example.com'
    assert_not c.valid?
  end

  test 'email format should be valid' do
    valid_addresses = %w(user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn)
    valid_addresses.each do |address|
      a = @user.dup
      a.email = address
      assert a.valid?, "#{address.inspect} should be valid"
    end
    invalid_addresses = %w(user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz..com)
    invalid_addresses.each do |address|
      a = @user.dup
      a.email = address
      assert_not a.valid?, "#{address.inspect} should be invalid"
    end
  end

  test 'enforce uniqueness' do
    a = @user.dup
    a.save
    dup1 = User.new(username: 'blahblah', name: 'Blah Blah', email: @user.email.upcase,
                    password: 'a'*20, password_confirmation: 'a'*20)
    assert_not dup1.valid?
    dup2 = User.new(username: @user.username, name: 'Blah Blah', email: 'blah@blah.blah',
                    password: 'a'*20, password_confirmation: 'a'*20)
    assert_not dup2.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    a = @user.dup
    a.email = mixed_case_email
    a.save
    assert_equal mixed_case_email.downcase, a.reload.email
  end

  test "password should be present (nonblank)" do
    a = @user.dup
    a.password = a.password_confirmation = " " * 6
    assert_not a.valid?
  end

  test "password should have a minimum length" do
    a = @user.dup
    a.password = a.password_confirmation = "a" * 5
    assert_not a.valid?
  end
end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'

class UserTest < Minitest::Test

  def test_user_class_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_what_name_is
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_what_jokes_are
    sal = User.new("Sal")

    assert_equal [], sal.jokes
  end

  def test_that_joke_1_and_joke_2_can_exist
    sal = User.new("Sal")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")

    assert_instance_of Joke, joke_1
    assert_instance_of Joke, joke_2
  end

  def test_if_sal_can_tell_jokes
    sal = User.new("Sal")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    sal.learn(joke_1)
    sal.learn(joke_2)

    assert_equal [joke_1,joke_2], sal.jokes
  end

  def test_user_ali_exists
    ali = User.new("Ali")

    assert_instance_of User, ali
  end

  def test_that_sal_can_tell_ali_a_joke
    sal = User.new("Sal")
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    ali = User.new("Ali")
    sal.tell(ali, joke_1)
    sal.tell(ali, joke_2)

    assert_equal [joke_1, joke_2], ali.jokes
  end
end

# pry(main)> sal.tell(ali, joke_1)
#
# pry(main)> sal.tell(ali, joke_2)
#
# pry(main)> ali.jokes
# # => [#<Joke:0x00007fb71da169f0...>, #<Joke:0x00007fb71d8e0bd0...>]
#
# pry(main)> ali.joke_by_id(1)
# # => #<Joke:0x00007fb71da169f0...>
#
# pry(main)> ali.joke_by_id(2)
# # => #<Joke:0x00007fb71d8e0bd0...>

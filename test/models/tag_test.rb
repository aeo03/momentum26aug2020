require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @tagU = Tag.create(tag_name: 'Life')
    @tag = Tag.new(tag_name: 'Motivation')
  end

  test "1. should not save Tag not unique " do
    tag1 = Tag.new(tag_name: 'Life')
    assert_not tag1.save, "Saved the Tag that is not unique"
  end

  test "2. should not save Tag without tag name" do
    @tag.tag_name = nil
    assert_not @tag.save, "Saved the Tag without a tag name"
  end

  test "3. should not save Tag when tag name length is less than 2 " do
    @tag.tag_name = 'a'
    assert_not @tag.save, "Saved the Tag when tag name length is less than 2"
  end


end

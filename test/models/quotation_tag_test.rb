require 'test_helper'

class QuotationTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do

    @creator = Creator.create(author: "test author")
    @quotation = Quotation.create(quote: "test quote", creator_id: @creator.id)
    @tag = Tag.create(tag_name: "test tag")
    
    @qt = QuotationTag.new(tag_id: @tag.id, quotation_id: @quotation.id)
  end

  test "11. should not save Quotation Tag without tag id" do
    @qt.tag_id = nil
    assert_not @qt.save, "Saved the Quotation Tag without tag id"
  end

  test "12. should not save Quotation Tag without quotation id" do
    @qt.quotation_id = nil
    assert_not @qt.save, "Saved the Quotation Tag without quotation id"
  end

  test "13. should save Quotation Tag" do
    assert @qt.save
  end

end

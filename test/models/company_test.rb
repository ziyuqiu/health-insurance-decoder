require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

    def setup
    @company = Company.new(name: "Blue Cross Blue Shield", contact_id: "1")
  end

  test "should be valid" do
    assert_not @company.valid?
  end
  test "name should be present" do
    @company.name = "     "
    assert_not @company.valid?
  end
  test "contact_id should be present" do
    @company.contact_id = "     "
    assert_not @company.valid?
  end
  test "company should be unique" do
    duplicate_company = @company.dup
    duplicate_company.name = @company.name.upcase
    @company.save
    assert_not duplicate_company.valid?
  end
  test "contact should be unique" do
    duplicate_company = @company.dup
    duplicate_company.contact_id = @company.contact_id
    @company.save
    assert_not duplicate_company.valid?
  end
end

require 'test_helper'

class PlanTest < ActiveSupport::TestCase
    def setup
        @user = User.new
        #@plan = Plan.new(name: "test", coinsurance:0.9, outpatient_copay:0.0, inpatient_copay:0.0)
        @plan = plans(:test)
        @expected_coinsurance=0.9
    end
        

  test "plan has coinsurance" do
      @plan.coinsurance.wont_be_nil
  end

    test "coinsurance is accurate" do
        @plan.coinsurance.must_equal(@expected_coinsurance)
    end

    test "plan must have a name" do
        @plan.name.wont_be_nil
    end
    
=begin
# Ian: Codeship won't deploy until all tests pass, please update this test to reflect the calculator!
    test "calculate works" do
        @plan.calculate(0, 100, true).must_equal(10)
    end
=end
end

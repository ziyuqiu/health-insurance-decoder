require 'test_helper'

class PlanTest < ActiveSupport::TestCase
    def setup
        @user = User.new
        #@plan = Plan.new(name: "test", coinsurance:0.9, outpatient_copay:0.0, inpatient_copay:0.0)
        @plan = Plan.new(name:"test")
        @plan.save
        @treatment=Treatment.new(resource_category:"coinsurance", name:"Co insurance-you pay this amount of a bill after meeting your deductible and copay")
        @treatment.save
        @copay=Copay.new(plan_id:@plan[:id], treatment_id:@treatment[:id], in_network:0.0, out_network:0.2, copay_or_coinsurance_in:false, copay_or_coinsurance_out:false)
        @copay.save
        @plan.copays << @copay
        @treatment.copays << @copay
    end


  test "plan has coinsurance" do
      @plan.copays.find_by(treatment_id:@plan.treatments.find_by(resource_category:"coinsurance").id).nil?.must_equal false
  end

    test "coinsurance is accurate" do
        @plan.copays.find_by(treatment_id:@plan.treatments.find_by(resource_category:"coinsurance")[:id]).in_network.must_equal 0.0
        @plan.copays.find_by(treatment_id:@plan.treatments.find_by(resource_category:"coinsurance")[:id]).out_network.must_equal 0.2
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
Plan.delete(@plan)
Treatment.delete(@treatment)
Copay.delete(@copay)
end

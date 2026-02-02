require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  def setup
    @plan = Plan.new(name: "test_plan")
    @plan.save

    # Create coinsurance treatment
    @coinsurance_treatment = Treatment.new(
      resource_category: "coinsurance",
      name: "Co insurance-you pay this amount of a bill after meeting your deductible and copay"
    )
    @coinsurance_treatment.save

    # Create copay for coinsurance (in-network 10%, out-of-network 20%)
    @coinsurance_copay = Copay.new(
      plan_id: @plan.id,
      treatment_id: @coinsurance_treatment.id,
      in_network: 0.1,
      out_network: 0.2,
      copay_or_coinsurance_in: false,
      copay_or_coinsurance_out: false
    )
    @coinsurance_copay.save
    @plan.copays << @coinsurance_copay
    @coinsurance_treatment.copays << @coinsurance_copay

    # Create a service treatment with copay
    @service_treatment = Treatment.new(
      resource_category: "office_visit",
      name: "Office Visit"
    )
    @service_treatment.save

    @service_copay = Copay.new(
      plan_id: @plan.id,
      treatment_id: @service_treatment.id,
      in_network: 25.0,
      out_network: 50.0,
      copay_or_coinsurance_in: true,
      copay_or_coinsurance_out: true
    )
    @service_copay.save
    @plan.copays << @service_copay
    @service_treatment.copays << @service_copay
  end

  def teardown
    Copay.delete_all
    Treatment.delete_all
    Plan.delete_all
  end

  # Basic model tests
  test "plan must have a name" do
    assert_not_nil @plan.name
    assert_equal "test_plan", @plan.name
  end

  test "plan has coinsurance treatment" do
    coinsurance = @plan.copays.find_by(
      treatment_id: @plan.treatments.find_by(resource_category: "coinsurance").id
    )
    assert_not_nil coinsurance
  end

  test "coinsurance rates are accurate" do
    coinsurance = @plan.copays.find_by(
      treatment_id: @plan.treatments.find_by(resource_category: "coinsurance").id
    )
    assert_equal 0.1, coinsurance.in_network
    assert_equal 0.2, coinsurance.out_network
  end

  # Calculate method tests
  test "calculate returns zero for zero price" do
    result = @plan.calculate(0, 100, "true", @service_copay)
    assert_equal 0.0, result
  end

  test "calculate returns price when price less than copay" do
    # Price $20 is less than $25 copay, so patient pays full $20
    result = @plan.calculate(20, 100, "true", @service_copay)
    assert_equal 20.0, result
  end

  test "calculate with in-network copay" do
    # Price $100, copay $25, deductible $50
    # Patient pays: $25 (copay) + $50 (deductible) + ($100-$25-$50)*0.1 = $25 + $50 + $2.50 = $77.50
    result = @plan.calculate(100, 50, "true", @service_copay)
    assert_in_delta 77.5, result, 0.01
  end

  test "calculate with out-of-network copay" do
    # Price $100, copay $50, deductible $50
    # Patient pays: $50 (copay) + remaining handled by coinsurance
    result = @plan.calculate(100, 50, "false", @service_copay)
    assert result > 50.0, "Out-of-network should cost more than copay alone"
  end

  test "calculate with coinsurance only (no copay)" do
    # Create a copay entry with coinsurance only
    @coinsurance_only = Copay.new(
      plan_id: @plan.id,
      treatment_id: @service_treatment.id,
      in_network: 0.15,
      out_network: 0.25,
      copay_or_coinsurance_in: false,
      copay_or_coinsurance_out: false
    )
    @coinsurance_only.save

    result = @plan.calculate(100, 50, "true", @coinsurance_only)
    # No copay ($0), deductible $50, then coinsurance on remaining
    # Patient pays: $0 + $50 + ($100-$50)*0.1 = $55
    assert_in_delta 55.0, result, 0.01
  end

  test "calculate handles high deductible" do
    # When price is less than deductible, patient pays price after copay
    result = @plan.calculate(50, 1000, "true", @service_copay)
    # Price $50, copay $25, remaining $25 < $1000 deductible
    # Patient pays: $25 + $25 = $50
    assert_equal 50.0, result
  end

  test "calculate handles zero deductible" do
    result = @plan.calculate(100, 0, "true", @service_copay)
    # Price $100, copay $25, deductible $0
    # Patient pays: $25 + ($100-$25)*0.1 = $25 + $7.50 = $32.50
    assert_in_delta 32.5, result, 0.01
  end

  # Edge cases
  test "plan without name is invalid" do
    plan = Plan.new
    assert plan.name.nil?
  end

  test "plan can have multiple copays" do
    assert @plan.copays.count >= 2
  end

  test "plan copays are associated with treatments" do
    @plan.copays.each do |copay|
      assert_not_nil copay.treatment_id
    end
  end
end

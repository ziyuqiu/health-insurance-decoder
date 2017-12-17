class Plan < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :copays
    has_many :treatments, through: :copays

    def calculate (price, deductible, network, choice)
        #calculating the patients out of pocket expenses for a medical service
        if network=="true"
            network=true
            if choice.copay_or_coinsurance_in
                copay=choice.in_network
                coinsurance=self.copays.find_by(treatment_id:self.treatments.find_by(resource_category:"coinsurance")).in_network
            else
                copay=0.0
                coinsurance=choice.in_network
            end
        else
            network=false
            if choice.copay_or_coinsurance_out
                copay=choice.out_network
                coinsurance=self.copays.find_by(treatment_id:self.treatments.find_by(resource_category:"coinsurance")).out_network
            else
                copay=0.0
                coinsurance=choice.out_network
            end
        end
        patient_pay=0.0
        if price<=copay
            patient_pay=price
            price=0.0
        else
            patient_pay=copay
            price = price - patient_pay
            if price>=deductible
                patient_pay=patient_pay+deductible
                price = price - deductible
                price = price * coinsurance
            end
            patient_pay=patient_pay+price
        end
        return patient_pay
    end
end

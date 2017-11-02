class Plan < ApplicationRecord
#    validates :coinsurance, presence:true
    has_many :user

    def calculate (price, deductible, inpatient)
        #calculating the patients out of pocket expenses for a medical service
        patient_pay=0.0
        if inpatient==true
            if price<=inpatient_copay
                patient_pay=price
                price=0.0
            else
                patient_pay=inpatient_copay
                price = price - patient_pay
                if price>=deductible
                    patient_pay=patient_pay+deductible
                    price = price - deductible
                    price = price * coinsurance
                end
                patient_pay=patient_pay+price
            end
        else
            if price<=outpatient_copay
                patient_pay=price
                price=0.0
            else
                patient_pay=outpatient_copay
                price = price - patient_pay
                if price>=deductible
                    patient_pay=patient_pay+deductible
                    price = price - deductible
                    price = price * coinsurance
                end
                patient_pay=patient_pay+price
            end
        end
        return patient_pay
    end
end

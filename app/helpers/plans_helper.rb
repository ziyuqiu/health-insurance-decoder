module PlansHelper
    def calculate
        #calculating the patients out of pocket expenses for a medical service
        plan=Plan.find_by(id:params[:id])
        patient_pay=0.0
        price=params[:price]
        if params[:inpatient]==true
            if price<plan[:inpatient_copay]
                patient_pay=price
                price=0.0
            else
                patient_pay=plan[:inpatient_copay]
                price = price - patient_pay
                if price>params[:deductible]
                    patient_pay=patient_pay+params[:deductible]
                    price = price - params[:deductible]
                    price = price * plan[:coinsurance]
                    patient_pay=patient_pay+price
                end
            end
        else
            if price<plan[:outpatient_copay]
                patient_pay=price
                price=0.0
            else
                patient_pay=plan[:outpatient_copay]
                price = price - patient_pay
                if price>params[:deductible]
                    patient_pay=patient_pay+params[:deductible]
                    price = price - params[:deductible]
                    price = price * plan[:coinsurance]
                    patient_pay=patient_pay+price
                end
            end
        end
        return patient_pay
    end
end

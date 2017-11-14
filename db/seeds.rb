require 'rubygems'
require 'json'


# Clears the tables that will be seeded.
def clean_db
  BodyPart.delete_all
  Symptom.delete_all
  Disease.delete_all
  BodyPartSymptomDisease.delete_all
  Treatment.delete_all
  Plan.delete_all
  Copay.delete_all
end


# Returns true if a record in a table exists.
def name_exists table, name
  return !table.where(name: name).empty?
end


# Builds a new symptom, disease, or body part.
def build_object table, name
  if name_exists(table, name)
    return
  end
  o = table.new(name: name)
  if !o.valid?
    return
  end
  o.save
end

# Builds a relationship tuple for a body part, symptom, and disease.
def build_relationship body_part_name, symptom_name, disease_name
  #puts "Calling build relationship for: #{body_part_name}, #{symptom_name}, #{disease_name}"
  body_part_set = BodyPart.where(name: body_part_name)
  symptom_set = Symptom.where(name: symptom_name)
  disease_set = Disease.where(name: disease_name)

  # If more than one object is found, or no objects found, then return, something went wrong.
  if body_part_set.size != 1
    #puts "Body part not found. #{body_part_set.inspect}"
    return
  elsif symptom_set.size != 1
    #puts "Symptom not found."
    return
  elsif disease_set.size != 1
    #puts "Disease not found."
    return
  end

  # Grab the first and only element in the sets.
  body_part = body_part_set.first
  symptom = symptom_set.first
  disease = disease_set.first

  tuple = BodyPartSymptomDisease.new(body_part_id: body_part.id, symptom_id: symptom.id, disease_id: disease.id)
  if !tuple.valid?
    #puts "#{body_part_name}, #{symptom_name}, #{disease_name} - not a valid tuple."
    return
  end
  #puts "#{body_part_name}, #{symptom_name}, #{disease_name} - a valid tuple."
  tuple.save
end

def setup_brandeis_plan
    brandeis=Plan.new(name:"Brandeis Insurance Plan", coinsurance:0.0)
    brandeis.save
    treatment=Treatment.new(resource_category:"coinsurance", name:"Co insurance-you pay this amount of a bill
after meeting your deductible and copay")
    treatment.save
    copay=Copay.new(plan_id:brandeis[:id],treatment_id:treatment[:id])
    copay.save
    brandeis.copays << copay
    treatment.copays << copay
    treatment=Treatment.new(resource_category:"preventative", name:"Preventive services")
    treatment.save
    copay=Copay.new(plan_id:brandeis[:id],treatment_id:treatment[:id])
    copay.save
    brandeis.copays << copay
    treatment.copays << copay
    treatment=Treatment.new(resource_category:"emergency", name:"Co-pay for emergency room visit")
    treatment.save
    copay=Copay.new(plan_id:brandeis[:id],treatment_id:treatment[:id])
    copay.save
    brandeis.copays << copay
    treatment.copays << copay
    treatment=Treatment.new(resource_category:"office_visit", name:"Co-pay for office visit")
    treatment.save
    copay=Copay.new(plan_id:brandeis[:id],treatment_id:treatment[:id])
    copay.save
    brandeis.copays << copay
    treatment.copays << copay
    treatment=Treatment.new(resource_category:"xray_labs_testing", name:"X-rays, labs, or testing")
    treatment.save
    copay=Copay.new(plan_id:brandeis[:id],treatment_id:treatment[:id])
    copay.save
    brandeis.copays << copay
    treatment.copays << copay
    treatment=Treatment.new(resource_category:"mri_ct_pet", name:"MRI, CT scan, or PET")
    treatment.save
    copay=Copay.new(plan_id:brandeis[:id],treatment_id:treatment[:id])
    copay.save
    brandeis.copays << copay
    treatment.copays << copay
    treatment=Treatment.new(resource_category:"mental_health", name:"Co-pay for Outpatient Mental Health")
    treatment.save
    copay=Copay.new(plan_id:brandeis[:id],treatment_id:treatment[:id])
    copay.save
    brandeis.copays << copay
    treatment.copays << copay
    treatment=Treatment.new(resource_category:"inpatient", name:"Inpatient Care")
    treatment.save
    copay=Copay.new(plan_id:brandeis[:id],treatment_id:treatment[:id])
    copay.save
    brandeis.copays << copay
    treatment.copays << copay
    treatment=Treatment.new(resource_category:"tier_1", name:"Tier 1 Prescriptions")
    treatment.save
    copay=Copay.new(plan_id:brandeis[:id],treatment_id:treatment[:id])
    copay.save
    brandeis.copays << copay
    treatment.copays << copay
    treatment=Treatment.new(resource_category:"tier_2", name:"Tier 2 Prescriptions")
    treatment.save
    copay=Copay.new(plan_id:brandeis[:id],treatment_id:treatment[:id])
    copay.save
    brandeis.copays << copay
    treatment.copays << copay
    treatment=Treatment.new(resource_category:"tier_3", name:"Tier 3 Prescriptions")
    treatment.save
    copay=Copay.new(plan_id:brandeis[:id],treatment_id:treatment[:id])
    copay.save
    brandeis.copays << copay
    treatment.copays << copay
    treatment=Treatment.new(resource_category:"dental", name:"Dental Treatment for Injury to Natural Teeth")
    treatment.save
    copay=Copay.new(plan_id:brandeis[:id],treatment_id:treatment[:id])
    copay.save
    brandeis.copays << copay
    treatment.copays << copay
    treatment=Treatment.new(resource_category:"eye", name:"Eye Examination")
    treatment.save
    copay=Copay.new(plan_id:brandeis[:id],treatment_id:treatment[:id])
    copay.save
    brandeis.copays << copay
    treatment.copays << copay
end

# BEGIN SEEDING

clean_db

elms = JSON.parse(open("./json/body_part_symptom_disease.json", 'r').read.to_s)
setup_brandeis_plan
elms.each do |elm|
  bp_name = elm["Body Part"].strip
  s_name = elm["Symptom"].strip
  d_name = elm["Disease"].strip

  build_object(BodyPart, bp_name)
  build_object(Symptom, s_name)
  build_object(Disease, d_name)

  build_relationship(bp_name.downcase, s_name.downcase, d_name.downcase)
end

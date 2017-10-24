# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rubygems'
require 'json'

def name_exists table, name
  return !table.where(name: name).empty?
end

BodyPart.delete_all
Symptom.delete_all
Disease.delete_all
BodyPartSymptomDisease.delete_all

s = open("./json/body_part_symptom_disease.json", 'r').read.to_s
elms = JSON.parse(s)


elms.each do |elm|
  bp_name = elm["Body Part"].strip
  s_name = elm["Symptom"].strip
  d_name = elm["Disease"].strip

  if name_exists(BodyPart, bp_name)
  else
    bp = BodyPart.create(name: bp_name)
  end

  if name_exists(Symptom, s_name)
  else
    s = Symptom.create(name: s_name)
  end
  
  if name_exists(Disease, d_name)
  else
    d = Disease.new(name: d_name)
    if !d.valid?
      # Do nothing.
    else
      puts "Creating new disease: #{d.name}"
      d.save
    end
  end
  
  #bp = BodyPart.create(name: elm["Body Part"])
  #s = Symptom.create(name: elm["Symptom"])
  #d = Disease.create(name: elm["Disease"])
  
end

#BodyPartSymptomDisease.create(body_part_id: bp.id, symptom_id: s.id, disease_id: d.id)

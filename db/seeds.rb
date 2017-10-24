# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rubygems'
require 'json'

BodyPart.delete_all
Symptom.delete_all
Disease.delete_all
BodyPartSymptomDisease.delete_all

s = open("./json/body_part_symptom_disease.json", 'r').read.to_s
elms = JSON.parse(s)

elms.each do |elm|
  bp = BodyPart.create(name: elm["Body Part"])
  s = Symptom.create(name: elm["Symptom"])
  d = Disease.create(name: elm["Disease"])
end

#BodyPartSymptomDisease.create(body_part_id: bp.id, symptom_id: s.id, disease_id: d.id)

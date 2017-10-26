require 'rubygems'
require 'json'


# Clears the tables that will be seeded.
def clean_db
  BodyPart.delete_all
  Symptom.delete_all
  Disease.delete_all
  BodyPartSymptomDisease.delete_all
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
def build_relationship bp_n, s_n, d_n
  bps = BodyPart.where(name: bp_n)
  ss = Symptom.where(name: s_n)
  ds = Disease.where(name: d_n)

  # If more than one object is found, or no objects found, then return, something went wrong.
  if bps.size != 1
    return
  elsif ss.size != 1
    return
  elsif ds.size != 1
    return
  end

  # Grab the first and only element in the sets.
  bp = bps.first
  s = ss.first
  d = ds.first

  bpsd = BodyPartSymptomDisease.new(body_part_id: bp.id, symptom_id: s.id, disease_id: d.id)
  if !bpsd.valid?
    puts "#{bp_n}, #{s_n}, #{d_n} - not a valid tuple."
    return
  end
  puts "#{bp_n}, #{s_n}, #{d_n} - a valid tuple."
  bpsd.save
end


# BEGIN SEEDING

clean_db

elms = JSON.parse(open("./json/body_part_symptom_disease.json", 'r').read.to_s)

elms.each do |elm|
  bp_name = elm["Body Part"].strip
  s_name = elm["Symptom"].strip
  d_name = elm["Disease"].strip

  build_object(BodyPart, bp_name)
  build_object(Symptom, s_name)
  build_object(Disease, d_name)

  build_relationship(bp_name, s_name, d_name)
end



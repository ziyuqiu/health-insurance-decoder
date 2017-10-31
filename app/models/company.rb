class Company < ApplicationRecord
	validates :name,  presence: true, uniqueness: true
	validates :contact_id, presence: true, uniqueness: true
end

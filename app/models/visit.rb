class Visit < ApplicationRecord
	has_many :logs
	has_many :symptoms
end

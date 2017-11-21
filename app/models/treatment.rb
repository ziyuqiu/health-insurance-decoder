class Treatment < ApplicationRecord
    has_many :copays
    has_many :plans, through: :copays
end

class Copay < ApplicationRecord
    belongs_to :treatment
    belongs_to :plan
end

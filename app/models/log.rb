class Log < ApplicationRecord
  belongs_to :symptom
  belongs_to :user
  def start_time
        self.created_at ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end

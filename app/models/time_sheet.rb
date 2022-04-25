class TimeSheet < ApplicationRecord
  belongs_to :user, dependent: :nullify
end

class Contact < ApplicationRecord
  belongs_to :kind
  has_one: address
end

class Relationship < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :article, class_name: "Project"
end

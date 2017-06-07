class PublishRelationship < ApplicationRecord
  belongs_to :publication
  belongs_to :project
  
end

class PartnerRelation < ApplicationRecord
  belongs_to :research_partner
  belongs_to :project
  
  
end

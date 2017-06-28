json.array!(@research_partners) do |research_partner|
  json.extract! research_partner, :id, :title, :description, :image
  json.url research_partner_url(research_partner, format: :json)
end

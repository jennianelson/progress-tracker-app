class GetCommonStandards
  include HTTParty
    
    def initialize(resource, set_id)
        @resource = resource
        @set_id = set_id
    end

    def api_call
      HTTParty.get("http://api.commonstandardsproject.com/api/v1/#{@resource}/#{@set_id}",
      :headers => {'Content-Type' => 'application/json', 'Api-key' => ENV['CSP_API_KEY']})
    end
    
    def get_standards
      standards = api_call["data"]["standards"].sort_by { |s| s[1]["asnIdentifier"]}
        standards.map do |standard|
          a = standard[1]
            if a["depth"] > 0
                if a["comments"]
                  { description: "#{a["description"]}--" + " #{a["comments"][0]}", asn_id: a["asnIdentifier"], dot_notation: a["statementNotation"] }
                else
                  { description: a["description"], asn_id: a["asnIdentifier"], dot_notation: a["statementNotation"] }
                end
            end
        end.compact
      end
    
    def get_subjects
      api_call["data"]["standardSets"].map do |s| 
        [ s["title"] + " " + s["subject"], s["id"] ]
      end 
    end

end
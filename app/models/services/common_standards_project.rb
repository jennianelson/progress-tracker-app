class CommonStandardsProject
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
      end.sort_by {|s| s[1]}
    end

    def get_unadded_subjects
      set_ids_array = Subject.collect_set_ids
      get_subjects.select do |subject|
        set_ids_array.exclude?(subject[1])
      end
    end

    def get_unadded_standards(subject)
      description_array = subject.standards.collect_descriptions
      get_standards.select do |standard_hash|
        description_array.exclude?(standard_hash[:description])
      end
    end

end
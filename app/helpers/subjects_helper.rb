module SubjectsHelper

    def subjects_array
        subjects = parse_api("jurisdictions", "B838B98D043045748F3814B9E43CAC85")["data"]["standardSets"]
        subjects.map { |s| [ s["title"] + " " + s["subject"], s["id"] ] }.sort_by {|s| s[1]} 
    end
    
end

module Helpers
    
    def Helpers.include?(movies,movie)
      match = false
      movies.each do |m|
        match = true if m == movie
      end
      match
    end
      
end
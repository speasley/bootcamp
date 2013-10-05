module Helpers  
    def include?(thing)
      match = false
      each do |t|
        match = true if t == thing
      end
      match
    end
end
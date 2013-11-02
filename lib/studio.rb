module Studio
  CastleRock = Object.new
  MiramaxFilms = Object.new
  RegencyEnterprises = Object.new
  Pixar = Object.new
  Disney = Object.new

  def self.matching(studio)
    MatchesStudio.new(studio)
  end

  class MatchesStudio < Matches
    def initialize(studio)
      super(:studio, studio)
    end
  end

end


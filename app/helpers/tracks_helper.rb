module TracksHelper

  
  def exposure_level
    @exposure_level = { 
      "E1"   => 10,
      "E2"   => 15,
      "E3"   => 20,
      "E4"   => 25
    } 
  end
  
  def exposure_level_points(exp)
    @exposures = exposure_level
    @exposures[exp]
  end
  
  def difficulty_level
    @difficulty_level = {
      "S1"   => 1,
      "S2-"  => 2,
      "S2"   => 3,
      "S2+"  => 4,
      "S3-"  => 5,
      "S3"   => 6,
      "S3+"  => 7,
      "S4-"  => 8,
      "S4"   => 9,
      "S4+"  => 10,
      "S5-"  => 11,
      "S5"   => 12,
      "S5+"  => 13,
      "S6"   => 14
    }
  end
  
  def difficulty_level_points(dif)
    @difficulty = difficulty_level
    @difficulty[dif]
  end
  
end

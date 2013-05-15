module StaticPagesHelper
  
  def title(titl)
    return "Skialpi | " + titl unless titl.empty?  
    "Skialpi"
  end
  
end

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(dist)
    hamming_dist = 0
    min_size = strand.length <= dist.length ? strand.length : dist.length

    min_size.times do |i|
      hamming_dist += 1 if strand[i] != dist[i]
    end
    hamming_dist
  end

end

# myDNA = DNA.new('ADGJ')
# puts myDNA.hamming_distance('GDGJ')




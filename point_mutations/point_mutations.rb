class DNA
  def initialize(dna)
    @dna = dna
  end

  def hamming_distance(comp_dna)
    hamming_distance = 0
    lead_dna = (@dna.size > comp_dna.size)? comp_dna : @dna
    trail_dna = (lead_dna == @dna)? comp_dna : @dna
    lead_dna =  lead_dna.chars
    trail_dna = trail_dna.chars

    lead_dna.each_with_index do |strnd, idx|
      hamming_distance += 1 if strnd != trail_dna[idx]
    end

    hamming_distance
  end
end

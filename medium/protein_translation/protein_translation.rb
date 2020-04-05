=begin

Problem:
  - Translate proteins
  - Keep translating (batch of three letters) until a stop codon is encountered



=end

class InvalidCodonError < ArgumentError
end

class Translation

  CODON_TO_AA = {'AUG' => 'Methionine', 'UUU' => 'Phenylalanine', 'UUC' => 'Phenylalanine',
                 'UUA' => 'Leucine', 'UUG' => 'Leucine', 'UCU' => 'Serine', 'UCC' => 'Serine', 
                 'UCA' => 'Serine', 'UCG' => 'Serine', 'UAU' => 'Tyrosine', 'UAC' => 'Tyrosine',
                 'UGU' => 'Cysteine', 'UGC' => 'Cysteine', 'UGG' => 'Tryptophan', 'UAA' => 'STOP',
                 'UAG' => 'STOP', 'UGA' => 'STOP' }

  def self.of_codon(codon)
    # translates one CODON to one AA
    # only returns one AA
    CODON_TO_AA[codon]
  end

  def self.of_rna(codon)
    raise InvalidCodonError if codon =~ /[^AGCU]/
    # raise an InvalidCodonError if contains neither four letters AGCU leeters
    # iterate thru the given codon, 3 at at time
    # create a return rna
    # combine then place is as a key for the hash
    # if STOP break
    # if nil next
    # else add it to return rna
    return_rna = []
    counter = 0
    (codon.size/3).times do
      grouped_codons = codon[counter, 3]
      counter += 3
      translated_codons = CODON_TO_AA[grouped_codons]
      break if translated_codons == 'STOP'
      next if translated_codons.nil?
      return_rna << translated_codons
    end

    return_rna
  end
end

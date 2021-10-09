# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  NEW_LINE = "\n"
  SEP = "\t"

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    lines = tsv.split(NEW_LINE)
    @headers = lines[0].split(SEP)
    @data = lines[1..].map do |line|
      blocks = line.split(SEP)
      hash = {}
      (0...@headers.length).map do |idx|
        hash[@headers[idx]] = blocks[idx]
      end
      hash
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    headers = @data[0].keys
    lines = @data.map do |block|
      row = headers.map { |header| block[header] }
      row.join(SEP)
    end
    "#{headers.join(SEP)}\n#{lines.join(NEW_LINE)}\n"
  end
end

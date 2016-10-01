# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    lines = tsv.split("\n")
    header = lines[0].split("\t")
    value = lines[1..-1]
    @data = value.map { |val| Hash[header.zip(val.split("\t"))] }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    tsv = ''
    tsv << @data[0].keys.join("\t") + "\n"
    @data.each { |dt| tsv << dt.values.join("\t") + "\n" }
    tsv
  end
end

class SearchResult
  attr_reader :option_1, :option_2, :option_3

  def initialize(option_1, option_2, option_3)
    @option_1 = option_1
    @option_2 = option_2
    @option_3 = option_3
  end

  def to_array
    [].tap do |arr|
      arr.concat([@option_1.people, @option_1.skills]) if @option_1.present?
      arr.concat([@option_2.people, @option_2.skills]) if @option_2.present?
      arr.concat([@option_3.people, @option_3.skills]) if @option_3.present?
    end
  end
end
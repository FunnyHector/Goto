class QueryForKeywords
  def initialize(keywords)
    @keywords = keywords
  end

  def call
    self.send("search_for_#{@keywords.size}_keywords".to_sym)
  end

  private

  def search_for_1_keywords
    #     1. find all people who know this skill
    #     2. then find the guy with most thumb_ups
    relation = Rank.with_skill(@keywords.first).order_by_most_thumb_ups.limit(3)

    option_1 = Option.new([relation.first.person], [relation.first.skill])
    option_2 = Option.new([relation.second.person], [relation.second.skill])
    option_3 = Option.new([relation.third.person], [relation.third.skill])

    SearchResult.new(option_1, option_2, option_3)

    #        a) if several people have same number of thumb_ups, the one who has fewer thumb_downs wins.
    #        b) if several people have same number of thumb_ups and same thumb_downs, they all win.
    #     3. find three (or lists of) guys in order
  end

  def search_for_2_keywords
    #     1. initialise the answer list
    #     2. find all people who know both of 2 keywords
    # FIXME this is wrong!!
    Rank.with_skill(@keywords.first).with_skill(@keywords.second).order_by_most_thumb_ups.limit(3)



    #       a. find the guy with most total thumb_ups in both keywords
    #          - if several people have same number of total thumb_ups, the one who has fewer total of thumb_downs wins.
    #          - if several people have same number of total thumb_ups and same total thumb_downs, they all win.
    #       b. find three (or lists of) guys in order, put them into the answer list
    #       c. if the answer list has three then return the answer. if not we need to search for single keyword
    #     3. find people who know single keyword (but not both)
    #       a. find the guy with most total thumb_ups in either keywords
    #          - if several people have same number of total thumb_ups, the one who has fewer total of thumb_downs wins.
    #          - if several people have same number of total thumb_ups and same total thumb_downs, they all win.
    #       b. find three (or lists of) guys in order, put them into the answer list
  end

  def search_for_3_keywords
    #     1. initialise the answer list
    #     2. find all people who know all of 3 keywords
    Rank.with_skill(@keywords.first)
      .with_skill(@keywords.second)
      .with_skill(@keywords.third)
      .order_by_most_thumb_ups.limit(3)

    #       a. find the guy with most total thumb_ups in 3 keywords
    #          - if several people have same number of total thumb_ups, the one who has fewer total of thumb_downs wins.
    #          - if several people have same number of total thumb_ups and same total thumb_downs, they all win.
    #       b. find three (or lists of) guys in order, put them into the answer list
    #       c. if the answer list has three then return the answer. if not we need to search for single keyword
    #     3. find people who know two keyword (but not all 3)
    #       (unfinished)
    #
    #
    #
    #
    #

  end

end

# The output has the following structure:
#   [
#     [ Person#1, Person#2, Person#3 ],   # person(people) of the 1st choice
#     [ Skill#1, Skill#2, Skill#3 ],      # skills that the people from the 1st choice know about
#     [ Person#4 ],                       # person(people) of the 2nd choice
#     [ Skill#1, Skill#2 ],               # skills that the people from the 2nd choice know about
#     [ Person#6, Person#2 ],             # person(people) of the 3rd choice
#     [ Skill#2, Skill#3 ]                # skills that the people from the 3rd choice know about
#   ]

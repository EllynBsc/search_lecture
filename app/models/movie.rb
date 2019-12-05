class Movie < ApplicationRecord
  belongs_to :director
  include PgSearch::Model

# FOR ONE MODEL
# i have a class method called search_by_title_and_syllabus that takes a parameter which is the user input in the form
  # pg_search_scope :search_by_title_and_syllabus, #class method that i can call on Movie
  #   against: [ :title, :syllabus ], #in which columns you want pg search to look for
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }

# FOR MODELS ASSOCIATED
 # pg_search_scope :global_search, #class method
 #    against: [ :title, :syllabus ],
 #    associated_against: {
 #      director: [ :first_name, :last_name ]
 #    }, #I WANT TO BE ABLE TO LOOK ALSO FOR FIRST_NAME LAST NAME OF DIRECTORS
 #    using: {
 #      tsearch: { prefix: true }
 #    }


# MULTISEARCH (PGSEARCH MAGIC TABLE)
 multisearchable against: [:title, :syllabus]
end


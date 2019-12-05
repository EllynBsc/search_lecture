class TvShow < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:title, :syllabus]


# PgSearch::Multisearch.rebuild(Movie) #building the magical table PGSEARCHDOCUMENT with TvShow
# PgSearch::Multisearch.rebuild(TvShow) #building the magical table PGSEARCHDOCUMENT with TvShow
results = PgSearch.multisearch('superman') #an array of instances of PGsearch model.


end

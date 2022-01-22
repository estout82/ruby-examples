
include PgSearch::Model

pg_search_scope <scope_name>, against: [<columns>]

pg_search_scope :search_person,                                 # weighted search against 2 columns
  against: {
    name: 'A',  # A is highest priority
    address: 'B'  # can go down to D
  }

pg_search_scope :search_name, against: :name,                   # allow matching partial words
  using: {
    tsearch: {
      prefix: true
    }
  }

Model.some_search_scope("query")                                # retrieve the rank for a search
  .with_pg_search_rank
  .first
  .pg_search_rank
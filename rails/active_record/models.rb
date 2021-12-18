
# defaults to :one = 0 :two = 2, etc..
enum column: [:one, :two, :three]

# has_many through
# specifiy a relationthip "through" another relationship
has_many :join_tables
has_many :other_entity, through: :join_tables
class ClientSearch
  attr_accessor :search, :search_terms

  def initialize(search)
    self.search = search
  end

  def find_clients
    Client.where(search_fields.matches_any(search_words))
  end

  private

  def search_fields
    Arel::Nodes::SqlLiteral.new("coalesce(first_name, '') || coalesce(middle_name, '') || coalesce(last_name, '') || coalesce(ss_number, '')")
  end

  def search_words
    search.split.collect { |word| "%#{word}%" }
  end
end

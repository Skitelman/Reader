Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  # TODO: Remove me
  field :fetch_entries do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      EntryFetcher.new.call
    }
  end
end

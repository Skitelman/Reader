Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The root of the schema"

  field :feed do
    type Types::FeedType
    argument :id, !types.ID
    description "Find a Feed by ID"
    resolve ->(obj, args, ctx) { Feed.find(args["id"]) }
  end
end

Types::FeedType = GraphQL::ObjectType.define do
  name "Feed"
  field :name, types.String
  field :url, types.String
  field :description, types.String
  field :entries, types[Types::EntryType]
end

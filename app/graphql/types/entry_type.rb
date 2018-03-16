Types::EntryType = GraphQL::ObjectType.define do
  name "Entry"
  field :title, types.String
  field :url, types.String
  field :published_at, types.String
  field :author, types.String
  field :summary, types.String
  field :content, types.String
end

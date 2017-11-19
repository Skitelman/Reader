class EntryFetcher
  attr_reader :feeds

  def initialize(feeds: [])
    @feeds = feeds.empty? ? Feed.all.to_a : feeds
  end

  def call
    feeds.each do |feed|
      raw_feed = Feedjira::Feed.fetch_and_parse(feed.url)
      raw_feed.entries.each do |raw_entry|
        entry = Entry.find_or_initialize_by(url: raw_entry.url, feed: feed)
        if entry.new_record?
          build_entry_from_raw_entry(entry, raw_entry)
        end
      end
    end
  end

  def build_entry_from_raw_entry(entry, raw_entry)
    entry_hash = raw_entry.to_h
    entry_hash.delete('categories')
    entry_hash.delete('entry_id')
    entry_hash['published_at'] = entry_hash.delete('published')
    entry_hash['image_url'] = entry_hash.delete('image')
    entry.update(entry_hash)
  end
end
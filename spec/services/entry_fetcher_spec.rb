require 'rails_helper'

RSpec.describe EntryFetcher do
  describe 'initialize' do
    it 'sets \'feeds\' to all feeds if no feed specified' do
      create(:feed)
      expect(described_class.new.feeds).to eq(Feed.all.to_a)
    end
  end
  describe 'call' do
    it 'creates a entries from feed' do
      feed = create(:feed)
      entry_fetcher = described_class.new(feeds: [feed])

      allow(Feedjira::Feed).to receive(:fetch_and_parse) { parsed_feed }
      expect{ entry_fetcher.call }.to change{ Entry.count }.from(0).to(1)
    end
    it 'does not create entries when they already exist' do
      feed = create(:feed)
      entry_fetcher = described_class.new(feeds: [feed])

      allow(Feedjira::Feed).to receive(:fetch_and_parse) { parsed_feed }
      entry_fetcher.call
      expect{ entry_fetcher.call }.not_to change{ Entry.count }
    end
  end

  def parsed_feed
    Feedjira::Feed.parse(File.read("spec/fixtures/sample_feed.xml"))
  end
end


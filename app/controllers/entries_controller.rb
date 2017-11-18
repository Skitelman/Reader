class EntriesController < ApplicationController
  def index
    @entries = Entry.all.order(published_at: :desc)
  end

  def refresh
    EntryFetcher.new.call
    redirect_to :index
  end

end

class EntriesController < ApplicationController
  def index
    @entries = Entry.all.order(published_at: :desc)
  end

end

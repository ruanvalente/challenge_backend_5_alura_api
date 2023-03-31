class VideoSearch
  def initialize(query)
    @query = query
  end

  def result
    return unless @query.present?

    Video.order(created_at: :desc).where('title LIKE ?', "%#{@query}%")
  end
end

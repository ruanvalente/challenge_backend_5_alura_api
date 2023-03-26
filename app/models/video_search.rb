class VideoSearch
  def initialize(query)
    @query = query
  end

  def result
    if @query.present?
      Video.order(created_at: :desc).where("title LIKE ?", "%#{@query}%")
    end
  end
end
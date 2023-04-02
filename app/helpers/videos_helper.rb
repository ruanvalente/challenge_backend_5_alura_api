module VideosHelper
  def calculate_offset(page, limit)
    (page - 1) * limit
  end

  def fetch_paginated_items(items, limit, offset)
    items.limit(limit).offset(offset)
  end

  def calculate_total_pages(total_items, limit)
    (total_items.to_f / limit).ceil
  end

  def validate_and_set_page_size(size, limit)
    size = limit if size > limit || size.zero?
    size
  end

  def paginate(items, page: 1, size: 20, limit: 5)
    page = page.to_i
    size = validate_and_set_page_size(size, limit)
    offset = calculate_offset(page, limit)
    items = fetch_paginated_items(items, limit, offset)
    total_pages = calculate_total_pages(Video.count, limit)
    current_page = [page, total_pages].min

    {
      items: items,
      total_pages: total_pages,
      current_page: current_page,
      limit: limit,
      size: size
    }
  end
end

class PaginationHandler
  PAGE = 1
  PER_PAGE = 30

  def self.paginate(objects, page = PAGE, per_page = PER_PAGE)
    return objects.page(page).per(per_page) unless objects.is_a? Array
    Kaminari.paginate_array(objects).page(page).per(per_page)
  end

  def self.pagination_summary(objects)
    { per_page: objects.limit_value,
      total_pages: objects.total_pages,
      current_page: objects.current_page,
      next_page: objects.next_page,
      prev_page: objects.prev_page }
  end
end

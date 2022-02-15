module Pagination
    def pagination(resources)
        {
            current:  resources.current_page,
            previous: resources.prev_page,
            next:     resources.next_page,   
            limit_value: resources.limit_value,
            pages:    resources.total_pages,
            count:    resources.total_count
        }
    end
end


# frozen_string_literal: true
Kaminari.configure do |config|
  config.default_per_page = 5
  config.page_method_name = :chapter
  config.param_name = :chapter
  config.params_on_first_page = true
  # config.max_per_page = nil
  # config.window = 4
  # config.outer_window = 0
  # config.left = 0
  # config.right = 0
end

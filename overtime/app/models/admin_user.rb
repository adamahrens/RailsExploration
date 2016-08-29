class AdminUser < User
  # Single table inheritence. The "type" field in the schema
  # will automatically be set to the class name. In this case "AdminUser"
end

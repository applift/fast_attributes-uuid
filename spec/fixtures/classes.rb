class Log
  extend FastAttributes

  attribute :method,     String
  attribute :request_id, UUIDTools::UUID
end

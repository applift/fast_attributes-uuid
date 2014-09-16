class Log
  extend FastAttributes

  attribute :method,     String
  attribute :request_id, UUIDTools::UUID
end

class SymbolUUID
  extend FastAttributes

  attribute :method,     :string
  attribute :request_id, :uuid
end

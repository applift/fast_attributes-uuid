require 'fast_attributes'
require 'uuidtools'

module FastAttributes
  module UUID
  end

  set_type_casting UUIDTools::UUID, <<-EOS.gsub(/^\s*/, '')
    case %s.length
    when 36 then UUIDTools::UUID.parse(%s)
    when 32 then UUIDTools::UUID.parse_hexdigest(%s)
    when 0  then nil
    else UUIDTools::UUID.parse_raw(%s)
    end
  EOS
end

require 'fast_attributes/uuid/version'

require 'fast_attributes'
require 'uuidtools'

module FastAttributes
  module UUID
  end

  set_type_casting UUIDTools::UUID, <<-EOS.gsub(/^\s*/, '')
    _value = %s
    case value.length
    when 36 then UUIDTools::UUID.parse(_value)
    when 32 then UUIDTools::UUID.parse_hexdigest(_value)
    when 0  then nil
    else UUIDTools::UUID.parse_raw(_value)
    end
  EOS
end

require 'fast_attributes/uuid/version'

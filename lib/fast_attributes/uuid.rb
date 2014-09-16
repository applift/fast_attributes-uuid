require 'fast_attributes'
require 'uuidtools'

module FastAttributes
  module UUID
  end

  type_cast UUIDTools::UUID, :uuid do
    from 'nil',             to: 'nil'
    from 'UUIDTools::UUID', to: '%s'
    otherwise <<-EOS
      case %s.length
      when 36 then UUIDTools::UUID.parse(%s)
      when 32 then UUIDTools::UUID.parse_hexdigest(%s)
      when 0  then nil
      else UUIDTools::UUID.parse_raw(%s)
      end
    EOS
  end
end

require 'fast_attributes/uuid/version'

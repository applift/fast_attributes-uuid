require 'spec_helper'

describe FastAttributes::UUID do
  it 'adds UUID type to supported list' do
    expect(FastAttributes.type_casting[UUIDTools::UUID].compile_method_body('id', 'argument').gsub(/\s*/, '')).to eq(<<-EOS.gsub(/\s*/, '')
      begin
        case argument
        when nil
          nil
        when UUIDTools::UUID
          argument
        else
          case argument.length
          when 36 then UUIDTools::UUID.parse(argument)
          when 32 then UUIDTools::UUID.parse_hexdigest(argument)
          when 0  then nil
          else UUIDTools::UUID.parse_raw(argument)
          end
        end
      rescue => e
        raise FastAttributes::TypeCast::InvalidValueError, %(Invalid value "\#{argument}" for attribute "id" of type "UUIDTools::UUID")
      end
    EOS
    )
  end

  it 'attribute parses UUID value' do
    log = Log.new
    log.request_id = 'd2b4b3e3-4f16-4aa8-bc43-cab90d008171'
    expect(log.request_id).to be_a(UUIDTools::UUID)
    expect(log.request_id.to_s).to eq('d2b4b3e3-4f16-4aa8-bc43-cab90d008171')
  end

  it 'attribute parses serialized UUID value' do
    log = Log.new
    log.request_id = 'D2B4B3E34F164AA8BC43CAB90D008171'
    expect(log.request_id).to be_a(UUIDTools::UUID)
    expect(log.request_id.to_s).to eq('d2b4b3e3-4f16-4aa8-bc43-cab90d008171')
  end

  it 'attribute parses raw UUID value' do
    uuid = UUIDTools::UUID.parse('d2b4b3e3-4f16-4aa8-bc43-cab90d008171')

    log = Log.new
    log.request_id = uuid.raw
    expect(log.request_id).to be_a(UUIDTools::UUID)
    expect(log.request_id.to_s).to eq('d2b4b3e3-4f16-4aa8-bc43-cab90d008171')
  end

  it 'allows to define attribute using symbol notation' do
    log = SymbolUUID.new
    log.request_id = 'd2b4b3e3-4f16-4aa8-bc43-cab90d008171'
    expect(log.request_id).to be_a(UUIDTools::UUID)
    expect(log.request_id.to_s).to eq('d2b4b3e3-4f16-4aa8-bc43-cab90d008171')
  end
end

require 'spec_helper'

describe FastAttributes::UUID do
  it 'adds UUID type to supported list' do
    expect(FastAttributes.type_casting).to eq({
      String          => 'String(%s)',
      Integer         => 'Integer(%s)',
      Array           => 'Array(%s)',
      Date            => 'Date.parse(%s)',
      Time            => 'Time.parse(%s)',
      DateTime        => 'DateTime.parse(%s)',
      UUIDTools::UUID => <<-EOS.gsub(/^\s*/, '')
        _value = %s
        case value.length
        when 36 then UUIDTools::UUID.parse(_value)
        when 32 then UUIDTools::UUID.parse_hexdigest(_value)
        when 0  then nil
        else UUIDTools::UUID.parse_raw(_value)
        end
      EOS
    })
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
end

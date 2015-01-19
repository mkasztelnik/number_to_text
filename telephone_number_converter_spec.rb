require 'rspec'
require_relative 'telephone_number_converter'

describe TelephoneNumberConverter do
  context '.create!' do
    it 'creates converter for valid telephone number' do
      TelephoneNumberConverter.create!('123456789')
    end

    it 'throws invalid exception when telephone number contains letters' do
      expect do
        TelephoneNumberConverter.create!('123a56789')
      end.to raise_exception(TelephoneNumberConverter::Invalid)
    end

    it 'throws invalid exception when telephone number is to long' do
      expect do
        TelephoneNumberConverter.create!('1234567890')
      end.to raise_exception(TelephoneNumberConverter::Invalid)
    end

    it 'throws invalid exception when telephone number is to short' do
      expect do
        TelephoneNumberConverter.create!('12345678')
      end.to raise_exception(TelephoneNumberConverter::Invalid)
    end
  end

  context '#to_strings' do
    it 'stays the same for 1 and 0' do
      converter = TelephoneNumberConverter.create!('101010101')

      expect(converter.to_strings).to eq ['101010101']
    end

    it 'creates 3 strings for 2' do
      converter = TelephoneNumberConverter.create!('101012101')

      expect(converter.to_strings).to eq ['10101A101', '10101B101', '10101C101']
    end

    it 'creates 3 strings for 3' do
      converter = TelephoneNumberConverter.create!('101013101')

      expect(converter.to_strings).to eq ['10101D101', '10101E101', '10101F101']
    end

    it 'creates 3 strings for 4' do
      converter = TelephoneNumberConverter.create!('101014101')

      expect(converter.to_strings).to eq ['10101G101', '10101H101', '10101I101']
    end

    it 'creates 3 strings for 5' do
      converter = TelephoneNumberConverter.create!('101015101')

      expect(converter.to_strings).to eq ['10101J101', '10101K101', '10101L101']
    end

    it 'creates 3 strings for 6' do
      converter = TelephoneNumberConverter.create!('101016101')

      expect(converter.to_strings).to eq ['10101M101', '10101N101', '10101O101']
    end

    it 'creates 3 strings for 7' do
      converter = TelephoneNumberConverter.create!('101017101')

      expect(converter.to_strings).to eq ['10101P101', '10101R101', '10101S101']
    end

    it 'creates 3 strings for 8' do
      converter = TelephoneNumberConverter.create!('101018101')

      expect(converter.to_strings).to eq ['10101T101', '10101U101', '10101W101']
    end

    it 'creates 3 strings for 9' do
      converter = TelephoneNumberConverter.create!('101019101')

      expect(converter.to_strings).to eq ['10101V101', '10101X101', '10101Y101']
    end

    it 'creates 3 strings for every number different thatn 1 or 0' do
      converter = TelephoneNumberConverter.create!('101015109')

       expect(converter.to_strings)
        .to eq [
                '10101J10V', '10101J10X', '10101J10Y',
                '10101K10V', '10101K10X', '10101K10Y',
                '10101L10V', '10101L10X', '10101L10Y'
               ]
    end
  end
end

describe Runner do

end
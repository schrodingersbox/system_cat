include SystemCat

describe SystemCat::Version do

  let(:default_path) { 'config/version.txt' }
  let(:path) { 'spec/data/version.txt' }
  let(:version) { SystemCat::Version.new(path) }
  let(:code) { 723 }

  #############################################################################
  # initialize

  describe '#initialize' do

    it 'reads the version' do
      expected = File.read(path).to_i
      expect(version.code).to eql(expected)
    end

    it 'defaults path to config/version.txt' do
      expect(File).to receive(:read).with(default_path).and_return(code.to_s)
      expect(Version.new.code).to eql(code)
    end
  end

  #############################################################################
  # decrement

  describe '#decrement' do

    it 'decrements the version code' do
      expected = version.code - 1
      version.decrement
      expect(version.code).to eql(expected)
    end

    it 'returns the version instance' do
      expect(version.increment).to eql(version)
    end
  end

  #############################################################################
  # increment

  describe '#increment' do

    it 'increments the version code' do
      expected = version.code + 1
      version.increment
      expect(version.code).to eql(expected)
    end

    it 'returns the version instance' do
      expect(version.increment).to eql(version)
    end
  end

  #############################################################################
  # save

  describe '#save' do

    it 'writes the code to the version file' do
      file = double('file')
      expect(File).to receive(:open).with(path, 'wb').and_yield(file)
      expect(file).to receive(:write).with(version.code)
      version.save
    end
  end

  #############################################################################
  # to_s

  describe '#to_s' do

    it 'converts the code to a version string' do
      version.code = 0
      expect(version.to_s).to eql('0.0.0')

      version.code = 10
      expect(version.to_s).to eql('0.1.0')

      version.code = 100
      expect(version.to_s).to eql('1.0.0')

      version.code = 1000
      expect(version.to_s).to eql('10.0.0')
    end
  end

  #############################################################################
  # bump

  describe '::bump' do

    it 'loads, increments, and saves the version' do
      expect(version).to_not be_nil
      expect(Version).to receive(:new).and_return(version)
      expect(version).to receive(:increment).and_return(version)
      expect(version).to receive(:save).and_return(true)
      expect(Version.bump).to be(true)
    end
  end
end

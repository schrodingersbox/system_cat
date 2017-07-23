include SystemCat

describe SystemCat::Shell do

  let(:command) { 'echo echo' }
  let(:result) { 'silence' }

  before(:each) do
    allow(Shell).to receive(:`)
    allow(Shell).to receive(:puts)
    allow(Shell).to receive(:exitstatus).and_return(0)
  end

  #############################################################################
  # run

  describe '::run' do

    it 'executes the command and captures the result' do
      expect(Shell).to receive(:exitstatus).and_return(0)
      expect(Shell).to receive(:`).with(command).and_return(result)
      expect(Shell.run(command)).to be(result)
    end

    it 'raises an error if a process exits without a 0 status' do
      expect(Shell).to receive(:exitstatus).and_return(21)
      expect { Shell.run(command) }.to raise_error('Command failed')
    end
  end
end

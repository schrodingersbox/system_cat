include SystemCat

describe SystemCat::Shell do

  let(:command) { 'echo echo' }
  let(:result) { 'silence' }

  before(:each) do
    allow(Shell).to receive(:`)
    allow(Shell).to receive(:puts)
    allow(Shell).to receive(:exitstatus).and_return(0)

    allow(Kernel).to receive(:exec)
  end

  #############################################################################
  # exec

  describe '::exec' do

    it 'executes the command and replaces the current process' do
      expect(Kernel).to receive(:exec).with(command)
      Shell.exec(command)
    end

    context 'when test flag is true' do

      it 'does not actually execute the command' do
        expect(Kernel).to_not receive(:exec).with(command)
        Shell.exec(command, test: true)
      end
    end
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

    context 'when force flag is true' do

      it 'ignores errors' do
        expect(Shell).to receive(:exitstatus).and_return(21)
        expect { Shell.run(command, force: true) }.to_not raise_error
      end
    end

    context 'when test flag is true' do

      it 'does not actually execute the command' do
        expect(Shell).to_not receive(:`)
        Shell.run(command, test: true)
      end
    end
  end
end

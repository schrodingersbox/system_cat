include SystemCat

describe SystemCat::Git do

  let(:tag) { '0.2.6' }

  before(:each) do
    allow(SystemCat::Shell).to receive(:run)
  end

  #############################################################################
  # checkout

  describe '::checkout' do

    it 'shells git checkout' do
      expect(Shell).to receive(:run).with('git checkout production')
      Git.checkout(:production)
    end
  end

  #############################################################################
  # commit

  describe '::commit' do

    it 'shells git commit' do
      expect(Shell).to receive(:run).with('git commit -a -m "test"')
      Git.commit('test')
    end

    context 'with no_verify option' do

      it 'includes --no-verify' do
        expect(Shell).to receive(:run).with('git commit -a -m "test" --no-verify')
        Git.commit('test', no_verify: true)
      end
    end
  end

  #############################################################################
  # merge

  describe '::merge' do

    it 'shells git merge' do
      expect(Shell).to receive(:run).with('git merge production')
      Git.merge(:production)
    end
  end

  #############################################################################
  # pull

  describe '::pull' do

    it 'shells git pull' do
      expect(Shell).to receive(:run).with('git pull')
      Git.pull
    end
  end

  #############################################################################
  # push

  describe '::push' do

    it 'shells git push' do
      expect(Shell).to receive(:run).with('git push origin master')
      Git.push(:origin, :master)
    end
  end

  #############################################################################
  # stash

  describe '::stash' do

    it 'shells git stash' do
      expect(Shell).to receive(:run).with('git stash')
      Git.stash
    end
  end

  #############################################################################
  # stash_apply

  describe '::stash_apply' do

    it 'shells git stash apply' do
      expect(Shell).to receive(:run).with('git stash apply')
      Git.stash_apply
    end
  end

  #############################################################################
  # status

  describe '::status' do

    let(:status_clean) { "On branch master\nnothing to commit, working tree clean\n" }
    let(:status_dirty) { "On branch master\nno changes added to commit\n" }

    it 'shells git status' do
      expect(Shell).to receive(:run).with('git status').and_return(status_clean)
      Git.status
    end

    it 'returns the current branch' do
      expect(Shell).to receive(:run).with('git status').and_return(status_clean)
      expect(Git.status[:branch]).to eql(:master)
    end

    it 'returns a flag if the repo is clean' do
      expect(Shell).to receive(:run).with('git status').and_return(status_clean)
      expect(Git.status[:clean]).to be(true)
    end

    it 'returns a flag if the repo is dirty' do
      expect(Shell).to receive(:run).with('git status').and_return(status_dirty)
      expect(Git.status[:clean]).to be(false)
    end
  end

  #############################################################################
  # tag

  describe '::tag' do

    it 'shells git tag' do
      expect(Shell).to receive(:run).with("git tag #{tag} && git push origin master --tags")
      Git.tag(tag)
    end
  end
end

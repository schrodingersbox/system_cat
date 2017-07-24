module SystemCat
  class Git

    def self.checkout(branch)
      Shell.run("git checkout #{branch}")
    end

    def self.commit(message)
      Shell.run(%(git commit -a -m "#{message}"))
    end

    def self.merge(branch)
      Shell.run("git merge #{branch}")
    end

    def self.pull
      Shell.run('git pull')
    end

    def self.push(remote, branch)
      Shell.run("git push #{remote} #{branch}")
    end

    def self.stash
      Shell.run('git stash')
    end

    def self.stash_apply
      Shell.run('git stash apply')
    end

    def self.status
      result = Shell.run('git status')

      return {
        branch: result[/On branch (\S+)/, 1].to_sym,
        clean: !result[/(nothing to commit, working tree clean)/, 1].nil?
      }
    end

    def self.tag(tag, remote = :origin, branch = :master)
      Shell.run("git tag #{tag} && git push #{remote} #{branch} --tags")
    end
  end
end

module SystemCat
  class Shell

    def self.run(command, force = false)
      puts '_______________________________________________________________________________'
      puts command

      result = `#{command}`
      puts result

      raise 'Command failed' unless exitstatus.zero? || force

      return result
    end

    def self.exitstatus
      $CHILD_STATUS.exitstatus
    end
  end
end

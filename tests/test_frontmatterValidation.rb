require 'test/unit'
require 'yaml'

class TestFrontMatterValidation < Test::Unit::TestCase

    def test_frontmattervalidation
        Dir['./_pins/*.json'].each do |path|
            data = YAML.load_file(path)

            keys = data.keys.map { |k| k.downcase }
            assert(keys.include?("githubhandle"), "githubhandle missing: #{path}")
            assert(keys.include?("latitude"), "latitude missing: #{path}")
            assert(keys.include?("longitude"), "longitude missing: #{path}")

            lines = File.readlines(path)
            assert("---\n" == lines[0], "opening --- missing: #{path}")
            assert(lines[4..-1].include?("---\n"), "closing --- missing: #{path}")
        end
    end

end

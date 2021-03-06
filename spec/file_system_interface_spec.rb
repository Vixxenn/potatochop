require 'helper'

describe Potatochop::FileSystemInterface do
  describe '#new' do
    it 'creates a new FileSystemInterface object with the proper source' do
      fs = Potatochop::FileSystemInterface.new('spec/fake_mockups')
      expect(fs.source).to eq("spec/fake_mockups")
    end
  end
  describe '#exists?' do
    it 'returns true if the given file exists' do
      fs = Potatochop::FileSystemInterface.new('spec/fake_mockups')
      expect(fs.exists?('foo.html.haml')).to be(true)
    end

    it 'returns false if the given file does not exist' do
      fs = Potatochop::FileSystemInterface.new('spec/fake_mockups')
      expect(fs.exists?('not_real.html')).to be(false)
    end
  end

  describe '#read' do
    it 'returns the content of the given files' do
      fs = Potatochop::FileSystemInterface.new('spec/fake_mockups')
      expect(fs.read('foo.html.haml')).to eq(File.read('spec/fake_mockups/foo.html.haml'))
    end

    it 'returns false if the given file does not exist' do
      fs = Potatochop::FileSystemInterface.new('spec/fake_mockups')
      expect { fs.read('not_real.html') }.to raise_error
    end
  end
end

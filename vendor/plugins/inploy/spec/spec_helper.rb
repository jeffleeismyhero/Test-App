$LOAD_PATH.unshift(File.join(File.dirname(__FILE__)))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
require 'inploy'
require 'inploy/locaweb'
require 'spec'
require 'ruby-debug'
require 'fakefs'

require 'shared_examples'

FakeFS.activate!

def stub_tasks
  subject.stub!(:tasks).and_return("rake acceptance rake spec rake asset:packager:create_yml")
end

def mute(object)
  object.stub!(:puts)
end

def stub_commands
  Kernel.stub!(:system)
end

def expect_command(command)
  Kernel.should_receive(:system).with(command)
end

def dont_accept_command(command)
  Kernel.should_not_receive(:system).with(command)
end

def file_doesnt_exists(file)
  File.delete file
end

def file_exists(file, opts = {})
  File.open(file, 'w') { |f| f.write(opts[:content] || '') }
end

def path_exists(path)
  FileUtils.mkdir_p path
end

def capture_rcs(string)
  {'git://'=>'git', 'svn://'=>'subversion', 'svn+ssh://'=>'subversion', 'http://'=>'subversion'}.each do |key,value|
    return value if string.to_s.match(key)
  end
end

def rcs_update(rcs)
  return "git pull origin master" if rcs == 'git'
  return "svn update" if rcs == 'subversion'
end

def rcs_setup(rcs)
  return "git clone --depth 1" if rcs == 'git'
  return "svn checkout" if rcs == 'subversion'
end
require 'spec_helper'

describe user('artifactory') do
  it { should exist }
end

describe group('artifactory') do
  it { should exist }
end 

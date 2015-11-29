require 'spec_helper'

describe file('/usr/lib/jvm/java-8-oracle-amd64/release') do
  it { should contain 'JAVA_VERSION="1.8.0_65"'}
end 

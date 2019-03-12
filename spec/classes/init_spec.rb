require 'spec_helper'
describe 'deceptionagent' do
  context 'with default values for all parameters' do
    it { should contain_class('deceptionagent') }
  end
end

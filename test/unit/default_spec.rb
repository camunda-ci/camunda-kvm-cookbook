require 'spec_helper'

describe 'camunda-cookbook-template::default' do
  let(:chef_run) do
    ChefSpec::Runner.new(
        platform: 'ubuntu',
        version: '14.04'
    )
  end

  before do
    # mock some databag
    ChefSpec::Server.create_data_bag('users',
      'user' => {
        'id' => 'user',
        'comment' => 'continuous integration user',
        'home' => '/home/user',
        'ssh_keygen' => true
      }
    )
  end

  it 'should include all the camunda-cookbook-template recipes by default' do
    chef_run.converge(described_recipe)

    expect(chef_run).to include_recipe('camunda-cookbook-template::default')
  end

end

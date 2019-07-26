# frozen_string_literal: true

RSpec.describe ChangelogBuilder::DataFetching::GitLog do
  let(:git_moch_path) { 'Users/WhoIsGoodBoy/git' }
  before do
    allow_any_instance_of(Object).to receive(:`).with('which git').and_return(git_moch_path)
  end

  it 'expect git log command executed' do
    expected_command = "git log --pretty='commit_hash:%h<-^_^->commit_description:%s<-^_^->author:%an<-^_^->time:%ct<-^_^->meta_info:%d'"

    expect_any_instance_of(Object).to receive(:`).with(expected_command).and_call_original

    subject.fetch_commits
  end

  context 'Git not installed' do
    let(:git_moch_path) { '' }

    it 'expect error raised if no git installed' do
      expect do
        subject.fetch_commits
      end.to raise_error(ChangelogBuilder::DataFetching::GitLog::GitNotFound)
    end
  end
end

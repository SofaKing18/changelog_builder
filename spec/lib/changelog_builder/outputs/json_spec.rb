# frozen_string_literal: true

RSpec.describe ChangelogBuilder::Outputs::Json do
  let(:hash) do
    {
      author: 'd.shpagin',
      commit_description: 'Git log command execution',
      commit_hash: '9dfa99b',
      meta_info: ' (HEAD -> master, tag: v0.0.1)',
      time: '1564177219'
    }
  end
  let(:commit) do
    ChangelogBuilder::DataFetching::Commit.new(hash)
  end

  let(:subject) { ChangelogBuilder::Outputs::Json.new }

  let(:expected_commit_hash) { { author: 'd.shpagin', comment: 'Git log command execution', tag: 'v0.0.1', hash: '9dfa99b', created_at: '1564177219' } }
  it 'saves expected json from one element' do
    expect(Oj.load(subject.save([commit]))).to eq([expected_commit_hash])
  end

  it 'saves expected json from array' do
    expect(Oj.load(subject.save([commit, commit]))).to eq([expected_commit_hash, expected_commit_hash])
  end
end

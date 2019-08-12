# frozen_string_literal: true

RSpec.describe ChangelogBuilder::Outputs::Markdown do
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

  let(:subject) { ChangelogBuilder::Outputs::Markdown.new }

  let(:expected_commit_hash) { { author: 'd.shpagin', comment: 'Git log command execution', tag: 'v0.0.1', hash: '9dfa99b', created_at: '1564177219' } }

  it 'generates expected markdown from array' do
    commits = [].tap do |array|
      (1..5).to_a.reverse.map do |qty|
        commit = ChangelogBuilder::DataFetching::Commit.new(
          author: 'd.shpagin',
          commit_description: 'Git log command execution',
          commit_hash: '9dfa99b',
          meta_info: ' (HEAD -> master)',
          time: '1564177219'
        ).tap do |object|
          object.tag = "v#{qty}.0.0"
        end

        array << [commit] * qty
      end
    end.flatten

    expect(subject.dump(commits).split("\n").reject { |el| el == '' }).to eq(
      [
        '## v5.0.0', 'Git log command execution', 'Git log command execution', 'Git log command execution', 'Git log command execution', 'Git log command execution',
        '## v4.0.0', 'Git log command execution', 'Git log command execution', 'Git log command execution', 'Git log command execution',
        '## v3.0.0', 'Git log command execution', 'Git log command execution', 'Git log command execution',
        '## v2.0.0', 'Git log command execution', 'Git log command execution',
        '## v1.0.0', 'Git log command execution'
      ]
    )
  end
end

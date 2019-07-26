# frozen_string_literal: true

RSpec.describe ChangelogBuilder::DataFetching::LogParser do
  let(:git_log_mock_data) do
    [
      "commit_hash:9dfa99b<-^_^->commit_description:Git log command execution<-^_^->author:d.shpagin<-^_^->time:1564177219<-^_^->meta_info: (HEAD -> master, tag: 'a')",
      'commit_hash:2d922ce<-^_^->commit_description:initial<-^_^->author:d.shpagin<-^_^->time:1564140696<-^_^->meta_info:'
    ]
  end

  it '#parse_strings to array or hash' do
    expect(subject.parse_strings(git_log_mock_data)).to eq([
      {
        'author' => 'd.shpagin',
        'commit_description' => 'Git log command execution',
        'commit_hash' => '9dfa99b',
        'meta_info' => " (HEAD -> master, tag: 'a')",
        'time' => '1564177219'
      },
      {
        'author' => 'd.shpagin',
        'commit_description' => 'initial',
        'commit_hash' => '2d922ce',
        'meta_info' => '',
        'time' => '1564140696'
      }
    ])
  end

  it '#parse_string to hash' do
    expect(subject.parse_string(git_log_mock_data.first)).to eq(
      'author' => 'd.shpagin',
      'commit_description' => 'Git log command execution',
      'commit_hash' => '9dfa99b',
      'meta_info' => " (HEAD -> master, tag: 'a')",
      'time' => '1564177219'
    )
  end

  it '#parse_string with empty string' do
    expect(subject.parse_string('')).to eq({
    })
  end
end

# frozen_string_literal: true

RSpec.describe ChangelogBuilder::DataFetching do
  before do
    allow_any_instance_of(ChangelogBuilder::DataFetching::GitLog).to receive(:fetch_commits).and_return(nil)
    allow_any_instance_of(ChangelogBuilder::DataFetching::LogParser).to receive(:parse_strings).and_return([
      {
        'author' => 'd.shpagin',
        'commit_description' => 'Git log command execution',
        'commit_hash' => '9dfa99b',
        'meta_info' => ' (HEAD -> master, tag: v3)',
        'time' => '1564177219'
      },
      {
        'author' => 'd.shpagin',
        'commit_description' => 'Some commit 3',
        'commit_hash' => '2d922ce',
        'meta_info' => '(tag: v2, refs: some_ref)',
        'time' => '1564140696'
      },
      {
        'author' => 'd.shpagin',
        'commit_description' => 'Some commit 2',
        'commit_hash' => '2d922ce',
        'meta_info' => '',
        'time' => '1564140696'
      },
      {
        'author' => 'd.shpagin',
        'commit_description' => 'Some commit 1',
        'commit_hash' => '2d922ce',
        'meta_info' => '(refs: another_ref, tag: v1)',
        'time' => '1564140696'
      }
    ])
  end

  it 'history returns array of Commit objects' do
    expect(ChangelogBuilder::DataFetching.history.length).to eq(4)
    first_el = ChangelogBuilder::DataFetching.history.first

    expect(first_el.is_a?(ChangelogBuilder::DataFetching::Commit)).to eq(true)
  end

  it 'sets tag of commit between tags' do
    result = ChangelogBuilder::DataFetching.history

    expect(result[0].tag).to eq('v3')
    expect(result[1].tag).to eq('v2')
    expect(result[2].tag).to eq('v2')
    expect(result[3].tag).to eq('v1')
  end
end

# frozen_string_literal: true

RSpec.describe ChangelogBuilder::DataFetching::Commit do
  let(:subject) { ChangelogBuilder::DataFetching::Commit }

  it 'Object initialized as expected' do
    hash = {
      author: 'd.shpagin',
      commit_description: 'Git log command execution',
      commit_hash: '9dfa99b',
      meta_info: ' (HEAD -> master, tag: v0.0.1)',
      time: '1564177219'
    }

    object = subject.new(hash)

    expect(object.author).to eq(hash[:author])
    expect(object.comment).to eq(hash[:commit_description])
    expect(object.hash).to eq(hash[:commit_hash])
    expect(object.meta).to eq(hash[:meta_info])
    expect(object.created_at).to eq(hash[:time])
    expect(object.tag).to eq('v0.0.1')
  end

  it 'If meta field empty -> no tag data' do
    object = subject.new(meta_info: '')

    expect(object.tag).to be_nil
  end

  it 'No tag field in meta field empty -> no tag data' do
    object = subject.new(meta_info: '(HEAD -> master)')

    expect(object.tag).to be_nil
  end
end

require 'fakefs/spec_helpers'
require 'spec_helper'


# class TestSnapshotUploader < ActiveRecord::Base
# 	mount_uploader :snapshot, SnapshotUploader
# end


	describe SnapshotUploader do

		include FakeFS::SpecHelpers

		context 'for non-production environment' do
			it 'should upload image to designated bucket on s3' do
				FakeFS.activate!
				FakeFS::File.should_receive(:chmod)
				File.open('test_file', 'w') do |f|
					f.puts('foo')
				end
				uploader_test = Issue.new(title: "something")
				uploader_test.snapshot = File.open('test_file')
				uploader_test.save!
        uploader_test.snapshot.url.should match /.*\/#{ENV['S3_BUCKET']}.*/
				FakeFS.deactivate!
			end
		end
end
require_relative '../test_helper'

describe Guard::Spinach do
  let(:spinach) { Guard::Spinach.new }
  let(:paths) { ['fake/path.feature', 'foo/bar.feature'] }

  describe '#run_on_changes' do
    it 'fires run on a runner' do
      Guard::Spinach::Runner.any_instance.expects(:system).with(
        'spinach fake/path.feature foo/bar.feature')
      spinach.run_on_changes(paths)
    end
  end
  describe "#run_all" do
    it "fires run on a runner" do
      Guard::Spinach::Runner.any_instance.expects(:system).with(
        "spinach ")
      subject.run_all
    end
  end
  describe "#start" do
    describe "with defaults" do
      it "does not fire run on a runner" do
        Guard::Spinach::Runner.any_instance.expects(:system).never
        subject.start
      end
    end
    describe "with all_on_start => true" do
      let(:options) do
        { :all_on_start => true }
      end
      it "fires run on a runner" do
        Guard::Spinach::Runner.any_instance.expects(:system).with(
          "spinach ")
        subject.start
      end
    end
  end
end

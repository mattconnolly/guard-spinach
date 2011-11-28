require_relative '../test_helper'

describe Guard::Spinach do
  subject do
    Guard::Spinach.new(data, options)
  end
  let(:paths) do
    ['fake/path.feature', 'foo/bar.feature']
  end
  let(:data) do
    []
  end
  let(:options) do
    {}
  end
  describe "#run_on_change" do
    it "fires run on a runner" do
      Guard::Spinach::Runner.any_instance.expects(:system).with(
        "spinach fake/path.feature foo/bar.feature")
      subject.run_on_change(['fake/path.feature', 'foo/bar.feature'])
    end
  end
  describe "#run_all" do
    it "fires run on a runner" do
      Guard::Spinach::Runner.any_instance.expects(:system).with(
        "spinach ")
      subject.run_all
    end
  end
end

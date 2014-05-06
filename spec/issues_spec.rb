# -*- ruby encoding: utf-8 -*-

require 'spec_helper'

describe "Diff::LCS Issues" do
  include Diff::LCS::SpecHelper::Matchers

  it "should not fail to provide a simple patchset (issue 1/string)" do
    s1, s2 = *%W(aX bXaX)
    correct_forward_diff = [
      [ [ '+', 0, 'b' ],
        [ '+', 1, 'X' ] ],
    ]

    diff_s1_s2 = Diff::LCS.diff(s1, s2)
    expect(change_diff(correct_forward_diff)).to eq(diff_s1_s2)

    expect(Diff::LCS.patch(s1, diff_s1_s2)).to eq(s2)
    expect(Diff::LCS.patch(s2, diff_s1_s2)).to eq(s1)
  end

  # it "should not fail to provide a simple patchset (issue 1/string)" do
  #   s2, s1 = *%W(aX bXaX)
  #   correct_forward_diff = [
  #     [ [ '-', 0, 'b' ],
  #       [ '-', 1, 'X' ] ],
  #   ]

  #   diff_s1_s2 = Diff::LCS.diff(s1, s2)
  #   expect(change_diff(correct_forward_diff)).to eq(diff_s1_s2)

  #   require 'debugger'
  #   debugger
  #   expect(Diff::LCS.patch(s2, diff_s1_s2)).to eq(s1)
  #   expect(Diff::LCS.patch(s1, diff_s1_s2)).to eq(s2)
  # end

  # it "should not fail to provide a simple patchset (issue 1/array)" do
  #   s1 = %w(a X)
  #   s2 = %W(b X a X)
  #   correct_forward_diff = [
  #     [ [ '+', 0, 'b' ],
  #       [ '+', 1, 'X' ] ],
  #   ]

  #   diff_s1_s2 = Diff::LCS.diff(s1, s2)
  #   expect(change_diff(correct_forward_diff)).to eq(diff_s1_s2)

  #   require 'debugger'
  #   debugger
  #   expect(Diff::LCS.patch(s2, diff_s1_s2)).to eq(s1)
  #   expect(Diff::LCS.patch(s1, diff_s1_s2)).to eq(s2)
  # end

  # it "should not fail to provide a simple patchset (issue 1/array)" do
  #   s1 = %W(b X a X)
  #   s2 = %w(a X)
  #   correct_forward_diff = [
  #     [ [ '-', 0, 'b' ],
  #       [ '-', 1, 'X' ] ],
  #   ]

  #   diff_s1_s2 = Diff::LCS.diff(s1, s2)
  #   expect(change_diff(correct_forward_diff)).to eq(diff_s1_s2)

  #   require 'debugger'
  #   debugger
  #   expect(Diff::LCS.patch(s2, diff_s1_s2)).to eq(s1)
  #   expect(Diff::LCS.patch(s1, diff_s1_s2)).to eq(s2)
  # end
end

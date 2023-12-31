# Autogenerated, do not edit. All changes will be undone.
# Source: https://github.com/pls-rs/pls/blob/main/pkg/brew/pls.template
class Pls < Formula
  desc "Prettier and powerful ls for the pros"
  homepage "https://pls.cli.rs/"
  version "0.0.1-beta.4"
  license "GPL-3.0-or-later"

  if OS.mac?
    url "https://github.com/pls-rs/pls/releases/download/v0.0.1-beta.4/pls-x86_64-apple-darwin.zip"
    sha256 "b11a2cc536a60e1f58792c1dfa8a02a33300f4f7d3cd6ea958915cf92e9da0da"
  elsif OS.linux?
    url "https://github.com/pls-rs/pls/releases/download/v0.0.1-beta.4/pls-x86_64-unknown-linux-musl.zip"
    sha256 "6f45fd1428b9436a479e3c2f193458b778ffb4f9ca08f66e1dfb28b3f9e0d6ee"
  end

  depends_on "libgit2"

  def install
    bin.install "pls"
  end

  test do
    linkage_with_libgit2 = (bin/"pls").dynamically_linked_libraries.any? do |dll|
      next false unless dll.start_with?(HOMEBREW_PREFIX.to_s)

      File.realpath(dll) == (Formula["libgit2"].opt_lib/shared_library("libgit2")).realpath.to_s
    end

    assert linkage_with_libgit2, "No linkage with libgit2! Cargo is likely using a vendored version."
  end
end

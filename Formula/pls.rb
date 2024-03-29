# Autogenerated, do not edit. All changes will be undone.
# Source: https://github.com/pls-rs/pls/blob/main/pkg/brew/pls.template
class Pls < Formula
  desc "Prettier and powerful ls for the pros"
  homepage "https://pls.cli.rs/"
  version "0.0.1-beta.6"
  license "GPL-3.0-or-later"

  if OS.mac?
    url "https://github.com/pls-rs/pls/releases/download/v0.0.1-beta.6/pls-x86_64-apple-darwin.zip"
    sha256 "497afa7a342addfc47512da06cef3e60898a31b414169e217e3b3fb18e2687ba"
  elsif OS.linux?
    url "https://github.com/pls-rs/pls/releases/download/v0.0.1-beta.6/pls-x86_64-unknown-linux-musl.zip"
    sha256 "8ba7543d1e9bb18e353a9a7b045f9be8387fdd96d4868bd2f3fe6999c3cf9f55"
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

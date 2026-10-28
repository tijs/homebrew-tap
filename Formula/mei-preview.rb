class MeiPreview < Formula
  desc "Preview of the native Apple-Silicon Swift/MLX local inference server"
  homepage "https://github.com/tijs/mei"
  url "https://github.com/tijs/mei/releases/download/v0.10.0-rc.1/mei-0.10.0-rc.1-macos-arm64.tar.gz"
  version "0.10.0-rc.1"
  sha256 "b5d25d220419b61ddc56fd7d1bf3fdf5c09da5439e3187efb204010271c1e57f"
  license "MIT"

  depends_on arch: :arm64

  def install
    libexec.install Dir["bin/*"]
    pkgshare.install "NOTICE.md", "THIRD-PARTY-NOTICES.md"
    doc.install "docs", "CHANGELOG.md", "README.md"
    (bin/"mei-preview").write_env_script libexec/"mei",
      MLXPRESS_MLX_METALLIB: libexec/"mlx.metallib"
  end

  def caveats
    <<~EOS
      Run this preview with mei-preview. Stable mei is installed separately.
      Flint/JANGH2 support is experimental and requires explicit opt-in.
      Qwen memory and contender throughput qualification remain incomplete.
      Model weights are not bundled.
    EOS
  end

  test do
    assert_match "mei 0.10.0-rc.1", shell_output("#{bin}/mei-preview --version")
    assert_path_exists libexec/"mlx.metallib"
    assert_path_exists libexec/"default.metallib"
    assert_path_exists libexec/"mlx.metallib.provenance"
    assert_path_exists pkgshare/"THIRD-PARTY-NOTICES.md"
  end
end

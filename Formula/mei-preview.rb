class MeiPreview < Formula
  desc "Preview of the native Apple-Silicon Swift/MLX local inference server"
  homepage "https://github.com/tijs/mei"
  url "https://github.com/tijs/mei/releases/download/v0.10.0-rc.2/mei-0.10.0-rc.2-macos-arm64.tar.gz"
  version "0.10.0-rc.2"
  sha256 "ad6fa3d40fea000d84a2e6413fabc3ee25a068e7813db8e9dd97e86c29d81e1d"
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
      Groot text-only pull/profile and native admission are verified.
      Stable contender correctness and throughput qualification remain open.
      Model weights are not bundled.
    EOS
  end

  test do
    assert_match "mei 0.10.0-rc.2", shell_output("#{bin}/mei-preview --version")
    assert_path_exists libexec/"mlx.metallib"
    assert_path_exists libexec/"mlx.metallib.provenance"
    assert_path_exists pkgshare/"THIRD-PARTY-NOTICES.md"
  end
end

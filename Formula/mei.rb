class Mei < Formula
  desc "Native Apple-Silicon Swift/MLX OpenAI-compatible local inference server"
  homepage "https://github.com/tijs/mei"
  url "https://github.com/tijs/mei/releases/download/v0.2.0/mei-0.2.0-macos-arm64.tar.gz"
  sha256 "5fdc983dbf3bfe15b33e0809213f333c6207384eb33604bdde32a869b9066ee9"
  license "MIT"

  depends_on arch: :arm64

  # The tarball is a prebuilt CLI/runtime bundle: the `mei` executable plus the
  # Metal kernel library (mlx.metallib) that vmlx loads from the executable's
  # directory at runtime, plus reader-facing docs. Model weights are NEVER
  # bundled — they are staged/downloaded separately (the server is pointed at
  # locally staged MLX checkpoints via --model-dir).
  def install
    bin.install "bin/mei"
    bin.install "bin/mlx.metallib"
    bin.install "bin/mlx.metallib.provenance" if File.exist?("bin/mlx.metallib.provenance")
  end

  def caveats
    <<~EOS
      mei is a local inference server. It does not bundle model weights; stage
      MLX checkpoints locally and point the server at them:

        mei --model-dir <dir> --served-model-id <id>

      See https://github.com/tijs/mei#readme for details on provisioning the
      Metal library and model lineup.
    EOS
  end

  test do
    assert_match "mei #{version}", shell_output("#{bin}/mei --version")
    assert_path_exists bin/"mlx.metallib"
  end
end

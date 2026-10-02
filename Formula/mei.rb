class Mei < Formula
  desc "Native Apple-Silicon Swift/MLX OpenAI-compatible local inference server"
  homepage "https://github.com/tijs/mei"
  url "https://github.com/tijs/mei/releases/download/v0.7.0/mei-0.7.0-macos-arm64.tar.gz"
  sha256 "c790cf895acd84c777aea439bdfe3b4a2d13ac1defc0b12ffc695f0f2f39b8a8"
  license "MIT"

  depends_on arch: :arm64

  # The tarball is a prebuilt CLI/runtime bundle: the `mei` executable plus the
  # Metal kernel library (mlx.metallib) that vmlx loads from the executable's
  # directory at runtime, plus reader-facing docs. Model weights are NEVER
  # bundled — they are staged/downloaded separately (the server is pointed at
  # locally staged MLX checkpoints via --model-dir).
  def install
    libexec.install "bin/mei", "bin/mlx.metallib"
    libexec.install "bin/mlx.metallib.provenance" if File.exist?("bin/mlx.metallib.provenance")
    (bin/"mei").write_env_script libexec/"mei",
      MLXPRESS_MLX_METALLIB: libexec/"mlx.metallib"
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
    assert_path_exists libexec/"mlx.metallib"
    assert_path_exists libexec/"mlx.metallib.provenance"
  end
end

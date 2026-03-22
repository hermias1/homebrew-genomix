class GenomixCli < Formula
  desc "AI-powered CLI for DNA sequence and genome analysis"
  homepage "https://github.com/hermias1/genomix-cli"
  url "https://github.com/hermias1/genomix-cli.git", tag: "v0.1.0"
  license "Apache-2.0"

  depends_on "python@3.12"
  depends_on "pipx"

  def install
    system "pipx", "install", ".", "--python", Formula["python@3.12"].opt_bin/"python3.12"
    # Link the genomix binary into the Homebrew bin
    bin.install_symlink Dir[HOMEBREW_PREFIX/"bin/genomix"]
  end

  def caveats
    <<~EOS
      Genomix CLI has been installed. To get started:

        genomix setup    # Check bioinformatics tool dependencies
        genomix init     # Initialize a project
        genomix          # Start interactive mode

      For local AI (default), install Ollama:
        brew install ollama
        ollama pull qwen3-coder:30b
    EOS
  end

  test do
    assert_match "genomix", shell_output("#{bin}/genomix --help")
  end
end

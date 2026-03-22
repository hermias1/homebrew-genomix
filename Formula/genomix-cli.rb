class GenomixCli < Formula
  include Language::Python::Virtualenv

  desc "AI-powered CLI for DNA sequence and genome analysis"
  homepage "https://github.com/hermias1/genomix-cli"
  url "https://files.pythonhosted.org/packages/42/ea/bdd0a196d80996a453e56cb61675e3609f3ff90f4adedf8e40a3b1f3ddd9/genomix_cli-0.1.0.tar.gz"
  sha256 "5b17d608cfc31755c923f6a95ce4a79e0e48d32b3624523609a00028b99ee8ba"
  license "Apache-2.0"

  depends_on "python@3.12"

  resource "anthropic" do
    url "https://files.pythonhosted.org/packages/07/6c/bebe0b875f9c5c421e00da59b2bdc3371770c622b4f6e40cdd78e25e082f/anthropic-0.86.0.tar.gz"
    sha256 "89b0e9b9e1e20bfc82b93fd7861c0442b4e49e70e83cf9ce08e3d28c04f8bd51"
  end

  resource "prompt-toolkit" do
    url "https://files.pythonhosted.org/packages/bb/6e/9d084c929dfe9e3bfe0c6a47e31f7e920e9b5b1af14a8d57e489a04a8a04/prompt_toolkit-3.0.52.tar.gz"
    sha256 "3234a8d90fe16932df028928093665b021d7f4d89a4f922dcc85999673825e93"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/pyyaml-6.0.3.tar.gz"
    sha256 "fca4a4399dcb3e52f38ae8963c37344b1e38e4541cd3e3843a435f09ce533bd6"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/28/03/40ab500d1269e7673547e3084a3eb498580280e02ab15e7ccab21d3b5caa/rich-14.3.3.tar.gz"
    sha256 "2d160d8d570e653fd4096d7d11c69d1c8c36e1ef2ec399ac6db70b36fb5f9a87"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/06/94/82699f252dc23c077ec20e73cabb84c0b215582e41e4f19e1ff0e8ba1d05/httpx-0.28.1.tar.gz"
    sha256 "75e98c5f16b0f35b567856f928f68f9c0262a863080f36f700ef910d8528debf"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Genomix CLI requires an AI backend. By default it uses Ollama (local):

        brew install ollama
        ollama pull qwen3-coder:30b

      Then start using genomix:

        genomix setup    # Check bioinformatics dependencies
        genomix init     # Initialize a project
        genomix          # Start interactive mode
    EOS
  end

  test do
    assert_match "genomix 0.1.0", shell_output("#{bin}/genomix --version")
  end
end

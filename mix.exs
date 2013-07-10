defmodule Continuum.Mixfile do
  use Mix.Project

  def project do
    [ app: :continuum,
      version: "0.0.1",
      elixir: "~> 0.9.4-dev",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    []
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    []
  end
end

defmodule Mix.Tasks.Download do
  def run(_) do
    System.cmd """
      # setup your local environment
      rm -rf priv/tzdata
      mkdir -p priv/tzdata

      # download the timezone data files
      wget 'ftp://ftp.iana.org/tz/tzdata-latest.tar.gz'

      # extract files
      tar -xvzf tzdata-latest.tar.gz -C priv/tzdata

      # remove useless files
      rm tzdata-latest.tar.gz
      cd priv/tzdata
      rm -f *.sh *.tab factory Makefile
    """
  end
end
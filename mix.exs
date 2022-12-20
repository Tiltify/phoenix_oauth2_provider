defmodule PhoenixOauth2Provider.Mixfile do
  use Mix.Project

  def project do
    [
      app: :phoenix_oauth2_provider,
      version: "0.5.1",
      elixir: "~> 1.14.2",
      elixirc_paths: elixirc_paths(Mix.env),
      start_permanent: Mix.env == :prod,
      compilers: Mix.compilers,
      deps: deps(),

      # Hex
      description: "The fastest way to set up OAuth 2.0 server in your Phoenix app",
      package: package(),

      # Docs
      name: "PhoenixOauth2Provider",
      docs: docs()
   ]
  end

  def application do
    [extra_applications: extra_applications(Mix.env)]
  end

  defp extra_applications(:test), do: [:ecto, :logger]
  defp extra_applications(_), do: [:logger]

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:ex_oauth2_provider,
      git: "https://github.com/Tiltify/ex_oauth2_provider",
      ref: "a0a2a5bac10a96891e9e8dfacadb63ae62a67bf1"},
      {:phoenix, "~> 1.7.0-rc.0", override: true},
      {:phoenix_html, "~> 3.0"},
      {:phoenix_view, "~> 2.0"},

      {:phoenix_ecto, "~> 4.4.0", only: [:test, :dev]},
      {:credo, "~> 1.6.7", only: [:dev, :test]},
      {:jason, "~> 1.0", only: [:dev, :test]},

      {:ex_doc, ">= 0.0.0", only: :dev},

      {:ecto_sql, "~> 3.8", only: :test},
      {:plug_cowboy, "~> 2.0", only: :test},
      {:postgrex, "~> 0.16.5", only: :test}
    ]
  end

  defp package do
    [
      maintainers: ["Dan Shultzer", "Benjamin Schultzer"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/danschultzer/phoenix_oauth2_provider"},
      files: ~w(lib LICENSE mix.exs README.md)
    ]
  end

  defp docs do
    [
      source_ref: "v0.5.1", main: "PhoenixOauth2Provider",
      canonical: "http://hexdocs.pm/phoenix_oauth2_provider",
      source_url: "https://github.com/danschultzer/phoenix_oauth2_provider",
      extras: ["README.md"]
    ]
  end
end

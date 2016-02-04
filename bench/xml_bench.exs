# bench/xml_bench.exs
defmodule XmlBench do
  use Benchfella

  setup_all do
    depth = :erlang.system_flag(:backtrace_depth, 100)
    {:ok, depth}
  end

  teardown_all depth do
    :erlang.system_flag(:backtrace_depth, depth)
  end

  @files System.cwd
  |> Path.join("xml/**/*.xml")
  |> Path.wildcard()

  Enum.map(@files, &IO.puts/1)

  bench "Parse all files" do
    Enum.map(@files, &Exmerl.from_file/1)
  end
end

defmodule KV.Bucket do
  use Agent

  @doc """
  Starts a new bucket
  """
  def start_link(_opts) do
    Agent.start_link fn -> %{} end
  end

  @doc """
  Get value from `bucket` and `key`
  """
  def get(bucket, key) do
    Agent.get(bucket, fn map -> Map.get(map, key) end)
  end

  @doc """
  Put `value` into `bucket` by `key`
  """
  def put(bucket, key, value) do
    Agent.update(bucket, fn map->Map.put(map, key, value) end)
  end

  @doc """
  Deletes `key` from `bucket`.

  Returns the curnt value of `key`, if `key` exists.
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, fn map->Map.pop(map, key) end)
  end
end

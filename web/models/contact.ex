defmodule Agenda.Contact do
  use Agenda.Web, :model

  schema "contacts" do
    field :name, :string
    field :email, :string
    field :phone, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :phone])
    |> validate_required([:name, :email, :phone])
  end
end

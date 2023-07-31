defmodule TeacherWeb.AlbumLive.Index do
  use TeacherWeb, :live_view

  alias Teacher.Recordings
  alias Teacher.Recordings.Album

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Album")
    |> assign(:album, Recordings.get_album!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Album")
    |> assign(:album, %Album{})
  end

  defp apply_action(socket, :index, params) do
    %{albums: albums, meta: meta} = Recordings.list_albums(params)

    socket
    |> assign(:albums, albums)
    |> assign(:meta, meta)
    |> assign(:page_title, "Listing Albums")
  end

end

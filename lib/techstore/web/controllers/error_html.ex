defmodule TechstoreWeb.ErrorHTML do
  use TechstoreWeb, :view

  def render("404.html", _assigns) do
    """
    <!DOCTYPE html>
    <html class="dark">
      <head><title>404 — Page introuvable</title></head>
      <body class="bg-gray-950 text-gray-100 flex items-center justify-center min-h-screen">
        <div class="text-center">
          <h1 class="text-8xl font-bold bg-gradient-to-r from-cyan-400 to-violet-500 bg-clip-text text-transparent">404</h1>
          <p class="mt-4 text-gray-500">Page introuvable</p>
          <a href="/" class="mt-6 inline-block text-cyan-400 hover:text-cyan-300">Retour à l'accueil →</a>
        </div>
      </body>
    </html>
    """
  end

  def render("500.html", _assigns) do
    """
    <!DOCTYPE html>
    <html class="dark">
      <head><title>500 — Erreur serveur</title></head>
      <body class="bg-gray-950 text-gray-100 flex items-center justify-center min-h-screen">
        <div class="text-center">
          <h1 class="text-8xl font-bold bg-gradient-to-r from-red-400 to-orange-500 bg-clip-text text-transparent">500</h1>
          <p class="mt-4 text-gray-500">Erreur interne</p>
          <a href="/" class="mt-6 inline-block text-cyan-400 hover:text-cyan-300">Retour à l'accueil →</a>
        </div>
      </body>
    </html>
    """
  end
end

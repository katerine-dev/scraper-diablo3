# Teste nº 1 ------------------------------------------------------------------------------------------------------------------------------------
# isso é o passo 2
URL_BASE <- "https://www.icy-veins.com/d3/"

endpoint <- "barbarian-rend-build-with-wrath-of-the-wastes"

url_completa <- paste0(URL_BASE, endpoint)

response <-
  httr::GET(url_completa, httr::write_disk("output/diablo.html"))

html_file <- readr::read_file("output/diablo.html")



# Parse -----------------------------------------------------------------------------------------------------------------------------------------

itens <- httr::content(response, encoding = "UTF-8") |>
  rvest::html_nodes("ul") |>
  rvest::html_text() |>
  tibble::enframe() |>
  dplyr::filter(name == c("5", "6", "7", "8"))

personagem <- httr::content(response, encoding = "UTF-8") |>
  rvest::html_nodes("h1") |>
  rvest::html_text() |>
  tibble::enframe()

#pronto <- lista |>
#  dplyr::full_join(lista_2)

# Teste nº 1 ------------------------------------------------------------------------------------------------------------------------------------
# isso é o passo 2
URL_BASE <- "https://www.icy-veins.com/d3/"

endpoint <- "barbarian-rend-build-with-wrath-of-the-wastes"

url_completa <- paste0(URL_BASE, endpoint)

response <- httr::GET(url_completa, httr::write_disk("output/diablo.html"))

html_file <- readr::read_file("output/diablo.html")



# Parse -----------------------------------------------------------------------------------------------------------------------------------------

  lista <- httr::content(response, encoding = "UTF-8") |>
    #xml2::xml_find_all("ul") |>
    rvest::html_nodes("ul")

  lista_2 <- lista[[5]] |>
   ## tem que transformar em um DF
  purrr::map(xml2::xml_attrs) |>
  purrr::map_df(~as.list(.))


lista[[8]]


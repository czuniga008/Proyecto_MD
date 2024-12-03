#### PROYETO FINAL
#### CARLOS ZUNIGA TREJO
#### MINERIA DE DATOS

#### PRIMERA PARTE: WEBSCRAPING
#### PREAPARACION DE ENTORNO
library(robotstxt)
library(xml2)
library(rvest)
library(stringr)


#### PLATAFORMAS DE TRABAJO REMOTO (FREELANCERS)
#### WEBSCRAPING DE TERMINOS Y CONDICIONES

### Workana
## 1. ESTABLECER URL
url <- "https://help.workana.com/hc/en-us/articles/360041499974-WORKANA-TERMS-AND-CONDITIONS?_gl=1%2A1uwf1ws%2A_gcl_aw%2AR0NMLjE3MzMxNjIyODUuQ2p3S0NBaUEwclc2QmhBY0Vpd0FRSDI4SWtCTVBac1d1WlJMdzFnSlJEUHpHWlhDOXJmZ0tUVGFZSVFHNy1HdWNhTERNNWd5aXhLMUpSb0NXQzhRQXZEX0J3RQ..%2A_gcl_au%2ANTY4NjI0OTA1LjE3MjYwMTUzMDA.%2A_ga%2ANjI0MjE5NzYxLjE3MTY1MjY3MDI.%2A_ga_61Z13C91TT%2AMTczMzE2MjI2Ny44LjEuMTczMzE2MjI4NC40My4wLjE0NjkyOTUyMTA."
## 2. VERIFICACION DE LA url
#paths_allowed(url)
## 3. EXTRAER html
workana_tyc <- read_html(url)
## 4. CONVERTIR A TEXTO
#text_workana <- html_text(workana_tyc)
## 5. EXTRACCION DE INFORMACION
# a) DOCUMENTO
documento <- workana_tyc %>%
  html_elements("h1.article-title.h2") %>%
  html_text() %>%
  str_trim()
# b) CONTENIDO
contenido <- workana_tyc %>%
  html_elements("div.article-body") %>%
  html_text() %>%
  str_trim()
## 6. OBJETO DE SALIDA
tyc_workana <- data.frame(documento=documento, contenido=contenido)
write.table(tyc_workana, file = "Output/tyc_workana.TXT", 
            sep = "/")

### Freelancer
## 1. ESTABLECER URL
url <- "https://www.freelancer.mx/about/terms"
## 2. VERIFICACION DE LA url
#paths_allowed(url)
## 3. EXTRAER html
freelancer_tyc <- read_html(url)
## 4. CONVERTIR A TEXTO
#text_freelancer <- html_text(freelancer_tyc)
## 5. EXTRACCION DE INFORMACION
# a) DOCUMENTO
documento <- freelancer_tyc %>%
  html_elements("h1.margin-t20.margin-b20") %>%
  html_text() %>%
  str_trim()
# b) CONTENIDO
contenido <- freelancer_tyc %>%
  html_elements("div.c9d-tabcnt.PageTerms") %>%
  html_text() %>%
  str_squish()
## 6. OBJETO DE SALIDA
tyc_freelancer <- data.frame(documento=documento, contenido=contenido)
write.table(tyc_freelancer, file = "Output/tyc_freelancer.TXT", 
            sep = "/")

### UpWork
## 1. ESTABLECER URL
url <- "https://www.upwork.com/legal#useragreement"
## 2. VERIFICACION DE LA url
#paths_allowed(url)
## 3. EXTRAER html
upwork_tyc <- read_html(url)
## 4. CONVERTIR A TEXTO
#text_upwork <- html_text(upwork_tyc)
## 5. EXTRACCION DE INFORMACION
# a) DOCUMENTO
documento <- upwork_tyc %>%
  html_elements("h2") %>%
  html_text() %>%
  str_trim()
documento <- documento[2]
# b) CONTENIDO
contenido <- upwork_tyc %>%
  html_elements("#contract-versions-15858") %>%
  html_text() %>%
  str_squish()
## 6. OBJETO DE SALIDA
tyc_upwork <- data.frame(documento=documento, contenido=contenido)
write.table(tyc_upwork, file = "Output/tyc_upwork.TXT", 
            sep = "/")


#### PLATAFORMAS DE TRABAJO REMOTO (MICROTRABAJO)
#### WEBSCRAPING DE TERMINOS Y CONDICIONES

### Clickworker
## 1. ESTABLECER URL
url <- "https://workplace.clickworker.com/en/agreements/5908?_ga=2.198356527.1605207660.1733110439-653907648.1733110439"
## 2. VERIFICACION DE LA url
#paths_allowed(url)
## 3. EXTRAER html
clickworker_tyc <- read_html(url)
## 4. CONVERTIR A TEXTO
#text_clickworker <- html_text(clickworker_tyc)
## 5. EXTRACCION DE INFORMACION
# a) DOCUMENTO
documento <- clickworker_tyc %>%
  html_elements("h1.mb-0") %>%
  html_text() %>%
  str_trim()
# b) CONTENIDO
contenido <- clickworker_tyc %>%
  html_elements("#mainContent") %>%
  html_text() %>%
  str_trim()
## 6. OBJETO DE SALIDA
tyc_clickworker <- data.frame(documento=documento, contenido=contenido)
write.table(tyc_clickworker, file = "Output/tyc_clickworker.TXT", 
            sep = "/")

### Microworkers
## 1. ESTABLECER URL
url <- "https://www.microworkers.com/terms.php"
## 2. VERIFICACION DE LA url
#paths_allowed(url)
## 3. EXTRAER html
microworkers_tyc <- read_html(url)
## 4. CONVERTIR A TEXTO
#text_microworkers <- html_text(microworkers_tyc)
## 5. EXTRACCION DE INFORMACION
# a) DOCUMENTO
documento <- microworkers_tyc %>%
  html_elements("h2") %>%
  html_text() %>%
  str_trim()
# b) CONTENIDO
contenido <- microworkers_tyc %>%
  html_elements("div.term-conditions") %>%
  html_text() %>%
  str_trim()
## 6. OBJETO DE SALIDA
tyc_microworkers <- data.frame(documento=documento, contenido=contenido)
write.table(tyc_microworkers, file = "Output/tyc_microworkers.TXT", 
            sep = "/")

### Toloka
## 1. ESTABLECER URL
url <- "https://join.toloka.ai/legal/user-agreement/"
## 2. VERIFICACION DE LA url
#paths_allowed(url)
## 3. EXTRAER html
toloka_tyc <- read_html(url)
## 4. CONVERTIR A TEXTO
#text_toloka <- html_text(toloka_tyc)
## 5. EXTRACCION DE INFORMACION
# a) DOCUMENTO
documento <- toloka_tyc %>%
  html_elements("h3.h_q.h_k") %>%
  html_text() %>%
  str_trim()
# b) CONTENIDO
contenido <- toloka_tyc %>%
  html_elements("div.m_D") %>%
  html_text() %>%
  str_trim()
## 6. OBJETO DE SALIDA
tyc_toloka <- data.frame(documento=documento, contenido=contenido)
write.table(tyc_toloka, file = "Output/tyc_toloka.TXT", 
            sep = "/")

### Appen
## 1. ESTABLECER URL
url <- "https://crowdgen.com/terms-of-service/"
## 2. VERIFICACION DE LA url
#paths_allowed(url)
## 3. EXTRAER html
appen_tyc <- read_html(url)
## 4. CONVERTIR A TEXTO
#text_appen <- html_text(appen_tyc)
## 5. EXTRACCION DE INFORMACION
# a) DOCUMENTO
documento <- appen_tyc %>%
  html_elements("h1.elementor-heading-title.elementor-size-default") %>%
  html_text() %>%
  str_trim()
# b) CONTENIDO
contenido <- appen_tyc %>%
  html_elements("div.e-con-inner") %>%
  html_text() %>%
  str_trim()
contenido <- contenido[2]
contenido <- paste(contenido, collapse = "\n\n")
## 6. OBJETO DE SALIDA
tyc_appen <- data.frame(documento=documento, contenido=contenido)
write.table(tyc_appen, file = "Output/tyc_appen.TXT", 
            sep = "/")

#### OBJTO DE SALIDA
tyc_df <- rbind(tyc_workana,tyc_freelancer,tyc_upwork,
                tyc_clickworker,tyc_microworkers,tyc_toloka,tyc_appen)
save(tyc_df, file =  "Output_a/tyc_df.RData")

rm(list = ls())

#### LEER OBJETOS GUARDADOS
load("Output/tyc_df.RData")



#### SEGUNDA PARTE: NPL
#### PREAPARACION DE ENTORNO
library(tm)
library(SnowballC)
library(wordcloud)

library(tidytext)
library(dplyr)
library(ggplot2)

#### CARGAR ARCHIVOS TXT
folder_path <- "Output/"

#### CREAR CORPUS A PARTIR DE LOS ARCHIVOS TXT
text_corpus <- Corpus(DirSource(folder_path, encoding = "UTF-8"), 
                      readerControl = list(language = "en"))

#### APLICAR TRANSFORMACIONES AL CORPUS
### CONVERTIR A MINUSCULAS
text_corpus <- tm_map(text_corpus, content_transformer(tolower))
### ELIMINAR SIGNOS DE PUNTUACION
text_corpus <- tm_map(text_corpus, removePunctuation)
### ELIMINAR NUMEROS
text_corpus <- tm_map(text_corpus, removeNumbers)
### ELIMINAR PALABRAS VACIAS (stopwords)
text_corpus <- tm_map(text_corpus, removeWords, stopwords("english"))
### REDUCIR PALABRAS A SU RAIZ (Stemming)
text_corpus <- tm_map(text_corpus, stemDocument, language = "english")
### ELIMINAR ESPACIOS ADICIONALES
text_corpus <- tm_map(text_corpus, stripWhitespace)

#### CREAR MATRIZ DE TERMINOS
dtm <- DocumentTermMatrix(text_corpus)
inspect(dtm)

#### ANALIZAR INFORMACION
### FRECUENCIA DE PALABRAS CON >= 50
findFreqTerms(dtm, lowfreq = 50)

### NUBE DE PALABRAS CON FRECUENCIA MINIMA DE 30
wordcloud(words = colnames(as.matrix(dtm)), 
          freq = colSums(as.matrix(dtm)), 
          min.freq = 30, 
          random.order = FALSE, 
          colors = brewer.pal(8, "Dark2"))

### ANALISIS DE PALABRAS ASOCIADAS CON WORK
findAssocs(dtm, terms = "work", corlimit = 0.5) # Palabras asociadas con 'work'

### ANALISIS DE BIGRAMAS
## EXTRAER TEXTO DEL CORPUS
text_data <- data.frame(text = sapply(text_corpus, as.character), 
                        stringsAsFactors = FALSE)
## TOKENIZAR BIGRAMAS
bigrams <- text_data %>%
  unnest_tokens(output = bigram, input = text, token = "ngrams", n = 2) %>%
  count(bigram, sort = TRUE) # Contar los bigramas
## FILTRAR LOS 15 BIGRAMAS MAS FRECUENTES
top_bigrams <- bigrams %>%
  slice_max(n, n = 15)
## GRAFICO DE BARRAS DE BIGRAMAS FRECUENTES
ggplot(top_bigrams, aes(x = reorder(bigram, n), y = n)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() + # Girar el gráfico
  labs(title = "Bigramas más frecuentes",
       x = "Bigramas",
       y = "Frecuencia") +
  theme_minimal()

#### OBJETO DE SALIDA
dtm_matrix <- as.matrix(dtm)
write.csv(dtm_matrix, "Output_a/dtm_resultados.csv")

rm(list = ls())

# END
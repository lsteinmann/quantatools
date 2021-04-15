Erechtheion <- read.csv("inst/extdata/Pakkanen_Tab_1.csv")

attributes(Erechtheion)$source <- "J. Pakkanen, Deriving Ancient Foot Units from Building Dimensions: a Statistical Approach Employing Cosine Quantogram Analysis, 2002, in: G. Burenhult (Ed.), Archaeological Informatics: Pushing the Envelope (Oxford 2002), 501--506 Table 1"

attributes(Erechtheion)

Erechtheion$ID <- NULL

usethis::use_data(Erechtheion, overwrite = TRUE)

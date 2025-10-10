library("tidyverse")

ccards <- read.csv("rawdata/Credit_Card_Clients.csv", header = FALSE, stringsAsFactors = FALSE)

colnames(ccards) <- as.character(ccards[2, ])

ccards <- ccards[-c(1,2), ]

head(ccards)

ccards[1:5,"default payment next month"]

# Cambia el nombre de la columna
colnames(ccards)[colnames(ccards) == "default payment next month"] <- "default_payment_next_month"
colnames(ccards)

dim(ccards)

sum(is.na(ccards))
library(Amelia)

missmap(ccards, main="missing map")

sapply(ccards, class)


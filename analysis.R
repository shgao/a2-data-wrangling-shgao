source("metric_functions.R")

cities <- c("Baltimore", "Charleston", "Chicago", "Columbus", "Dayton", 
           "Denver", "Kansas City", "Memphis", "Milwaukee", "Oklahoma City", 
           "Pittsburgh", "St. Louis", "Syracuse", "Wichita")

filenames <- list.files("data/prepped", pattern="*.csv", full.names=TRUE)
ldf <- lapply(filenames, read.csv)
dissimilarities <- lapply(ldf, dissimilarity)
interactions <- lapply(ldf, interaction)
isolations <- lapply(ldf, isolation)
df <- data.frame(unlist(dissimilarities), unlist(interactions), unlist(isolations))

rownames(df) <- cities
colnames(df)[1] <- 'dissimilarity.index'
colnames(df)[2] <- 'interaction.index'
colnames(df)[3] <- 'isolation.index'

plot(df$dissimilarity.index, xlab='City', ylab='Dissimilarity Index')
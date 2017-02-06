dissimilarity <- function(data) {
  X <- sum(data$pop.not.white)
  totpop <- sum(data$pop)
  P <- X/totpop
  
  dissimilarity.sum <- function(row) {
    ti <- as.numeric(noquote(unname(row[3])))
    xi <- as.numeric(noquote(unname(row[5])))
    pi <- xi/ti
    metric <- ti*abs(pi-P)
  }
  
  summed <- sum(apply(data, 1, dissimilarity.sum))
  summed/(2*totpop*P*(1-P))
}

interaction <- function(data) {
  X <- sum(data$pop.not.white)
  
  interaction.sum <- function(row) {
    xi <- as.numeric(noquote(unname(row[5])))
    ti <- as.numeric(noquote(unname(row[3])))
    yi <- as.numeric(noquote(unname(row[4])))
    metric <- (xi/X)*(yi/ti)
  }
  
  summed <- sum(apply(data, 1, interaction.sum))
}

isolation <- function(data) {
  X <- sum(data$pop.not.white)
  
  isolation.sum <- function(row) {
    xi <- as.numeric(noquote(unname(row[5])))
    ti <- as.numeric(noquote(unname(row[3])))
    metric <- (xi/X)*(xi/ti)
  }
  
  summed <- sum(apply(data, 1, isolation.sum))
}
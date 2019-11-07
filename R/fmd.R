fmd <- function(Xo,a)
	{
		X. <- as.matrix(Xo)
		n <- nrow(X.); p <- ncol(X.); N <- n*p
		m <- sample(N, round(a*N,0)) ; d <- length(m)
	for(j in 1:d){
		X.[m[j]] <- NA
		}
	return(X.)
	}

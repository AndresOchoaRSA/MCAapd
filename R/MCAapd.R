MCAapd <-function(dat.act) {

 n <-nrow(dat.act)
 s <-ncol(dat.act)	# n° variables
 
## Funcion TDC_NA ## Tabla disjuntiva completa

 TDC_NA <-function (df)
 {
    acm.util.df <- function(i) {
        cl <- df[, i]
        cha <- names(df)[i]
        n <- length(cl)
        cl <- as.factor(cl)
        x <- matrix(0, n, length(levels(cl)))

	  pos<-(1:n) + n * (unclass(cl) - 1)
	
	  nas <- is.na(pos)
	  for(cols in 1:length(nas)){
	  	if (nas[cols]){
			x[cols,] <- NA
	      }else{
			x[pos] <- 1
		}
	  }
        dimnames(x) <- list(row.names(df), paste(cha, levels(cl), 
            sep = "."))
        return(x)
    }
    G <- lapply(1:ncol(df), acm.util.df)
    G <- data.frame(G, check.names = FALSE)
    return(G)
 
}  ## end TDCNA

 TDCna <- TDC_NA(dat.act)  ## Funcn - tdc con NA

 x <-rowSums(TDCna,na.rm = TRUE) # Zi. suma por filas sin NA 
 y <-colSums(TDCna,na.rm = TRUE) # Z.j                sin NA

 sumy <-sum(y); sum(x)
 s1 <-mean(x) ; k2 <- n*s1
 Fs <-as.matrix(TDCna/k2)  ## F con NAs

 fi. <-rowSums(Fs,na.rm = TRUE)
 f.j <-colSums(Fs,na.rm = TRUE)
 Mn <-diag(1/fi.)
 Mp <-diag(1/f.j)
 Mn1.2 <-diag(sqrt(1/fi.))  
 Mp1.2 <-diag(sqrt(1/f.j))

## Multiplicación para obtener So con datos disponibles

 n <-nrow(Mn)
 p <-ncol(Fs)
 MnF <-matrix(0,n,p)	# == Mn1.2F

 for(j in 1:p){
	for(i in 1:n){

		uu <-na.omit(cbind(Mn1.2[i,],Fs[,j]))
		MnF[i,j] <-sum(uu[,1]*uu[,2])
		}
 }

  Mn1.2F <- MnF 

 So <- Mn1.2F%*%Mp1.2 
 rownames(So) <-rownames(Fs)
 colnames(So) <-colnames(Fs)
 StS <-t(So)%*%So  ## en Rp
 SSt <-So%*%t(So)  ## en Rn

eigen(StS); Lp <- eigen(StS)$values; Up <- eigen(StS)$vectors
eigen(SSt); Ln <- eigen(SSt)$values; Un <- eigen(SSt)$vectors

WP <- sum(Lp[2:3])/(sum(Lp)-1)  ## Poder descriptivo eje 1 y 2

Tp<- Mn1.2%*%So%*%Up ; Tn <- Mp1.2%*%t(So)%*%Un

rownames(Tp) <- rownames(So)
rownames(Tn) <- colnames(So)
rownames(Up) <- colnames(So)
rownames(Un) <- rownames(So)


results<-list(Lp,Up,Ln,Un,TDCna,WP,Tp,Tn)
names(results)<-c("Lp: Valores propios en Rp","Up: Vectores propios en Rp",
"Ln: Valores propios en Rn","Un: Vectores Propios en Rn",
"Zij: Tabla Disyuntiva Completa con NA","WP:Poder Descriptivo",
"Tp:Coordenadas en Rp","Tn: Coordenadas en Rn")
return(results)

} ## end MCAapd

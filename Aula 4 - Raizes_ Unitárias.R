> install.packages("urca")
Installing package into 'C:/Users/Renata/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/urca_1.3-0.zip'
Content type 'application/zip' length 1060448 bytes (1.0 MB)
downloaded 1.0 MB

package 'urca' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Renata\AppData\Local\Temp\RtmpmKUniS\downloaded_packages
> library("urca")
> library(readxl)
> interdaay <- read_excel("C:/Econometria/interdaay.xls",
                          + col_types = c("date", "numeric", "numeric", "numeric"))
Error: `path` does not exist: 'C:/Econometria/interdaay.xls'
> interdaay <- read_excel("C:/EconometriaA/interdaay.xls",
                          + col_types = c("date", "numeric", "numeric", "numeric"))
Error: `path` does not exist: 'C:/EconometriaA/interdaay.xls'
> interdaay <- interdaay[,-1]
Error: object 'interdaay' not found
> library(readr)
> interdaay <- read_csv("interdaay.xls")
Parsed with column specification:
  cols(
    `<d0><cf><U+0871><e1>` = col_character()
  )
Warning: 1322 parsing failures.
row # A tibble: 5 x 5 col     row col                                expected  actual        file            expected   <int> <chr>                              <chr>     <chr>         <chr>           actual 1     1 "\xd0\xcf\x11\xe0\xa1\xb1\x1a\xe1" ""        embedded null 'interdaay.xls' file 2     2 "\xd0\xcf\x11\xe0\xa1\xb1\x1a\xe1" ""        embedded null 'interdaay.xls' row 3     3 "\xd0\xcf\x11\xe0\xa1\xb1\x1a\xe1" ""        embedded null 'interdaay.xls' col 4     3 NA                                 1 columns 20 columns    'interdaay.xls' expected 5     4 "\xd0\xcf\x11\xe0\xa1\xb1\x1a\xe1" ""        embedded null 'interdaay.xls'
... ... [... truncated]
Warning message:
  In rbind(names(probs), probs_f) :
  number of columns of result is not a multiple of vector length (arg 1)
> View(interdaay)
> library(readr)
> interdaay <- read_csv("C:/EconometriaA/interdaay.xls")
Parsed with column specification:
  cols(
    `<d0><cf><U+0871><e1>` = col_character()
  )
Warning: 1322 parsing failures.
row # A tibble: 5 x 5 col     row col                          expected  actual      file                      expected   <int> <chr>                        <chr>     <chr>       <chr>                     actual 1     1 "\xd0\xcf\x11\xe0\xa1\xb1\x~ ""        embedded n~ 'C:/EconometriaA/interda~ file 2     2 "\xd0\xcf\x11\xe0\xa1\xb1\x~ ""        embedded n~ 'C:/EconometriaA/interda~ row 3     3 "\xd0\xcf\x11\xe0\xa1\xb1\x~ ""        embedded n~ 'C:/EconometriaA/interda~ col 4     3 NA                           1 columns 20 columns  'C:/EconometriaA/interda~ expected 5     4 "\xd0\xcf\x11\xe0\xa1\xb1\x~ ""        embedded n~ 'C:/EconometriaA/interda~
... ........................... . [... truncated]
Warning message:
  In rbind(names(probs), probs_f) :
  number of columns of result is not a multiple of vector length (arg 1)
> View(interdaay)
> interdaay <- read_excel("C:/Econometria/interdaay.xls",
                          + col_types = c("date", "numeric", "numeric", "numeric"))
Error: `path` does not exist: 'C:/Econometria/interdaay.xls'
> interdaay <- read_excel("C:/EconometriaA/interdaay.xls",
                          + col_types = c("date", "numeric", "numeric", "numeric"))
> colnames(interdaay)[3] <- "variacao"
> interdaay <- interdaay[,-1]
> dados_diarios <- ts(interdaay, start = 2017-01-10, frequency = 365)
> plot(dados_diarios, col= "blue", main="Dados do Indice Bovespa", xlab="Dias")
> variacao <- ts(interdaay$variacao, start = 2017-01-10, frequency = 365)
> Ibovespa <- ts(interdaay$Ibovespa, start = 2017-01-10, frequency = 365)
> Quantidade <- ts(na.omit(interdaay$Quantidade, start = 2017-01-10, frequency = 365))
> plot(variacao, main="Percentual de Variação")
> plot(Ibovespa, main="Indice do Dia",col="red")
> plot(Quantidade, main="Indice do Dia", xlab="Dias", col="blue")
> TesteDF_Variacao_none <- ur.df(variacao, "none",lags = 0)
> summary(TesteDF_Variacao_none)

############################################### 
# Augmented Dickey-Fuller Test Unit Root Test # 
############################################### 

Test regression none 


Call:
  lm(formula = z.diff ~ z.lag.1 - 1)

Residuals:
  Min      1Q  Median      3Q     Max 
-8.0931 -0.8798 -0.0037  0.8675  6.6005 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
z.lag.1 -0.99742    0.02399  -41.58   <2e-16 ***
  ---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 1.468 on 1740 degrees of freedom
Multiple R-squared:  0.4984,	Adjusted R-squared:  0.4982 
F-statistic:  1729 on 1 and 1740 DF,  p-value: < 2.2e-16


Value of test-statistic is: -41.5838 

Critical values for test statistics: 
  1pct  5pct 10pct
tau1 -2.58 -1.95 -1.62

> TesteDF_Variacao_drift <- ur.df(variacao, "drift", lags=0)
> summary(TesteDF_Variacao_drift)

############################################### 
# Augmented Dickey-Fuller Test Unit Root Test # 
############################################### 

Test regression drift 


Call:
  lm(formula = z.diff ~ z.lag.1 + 1)

Residuals:
  Min      1Q  Median      3Q     Max 
-8.0978 -0.8845 -0.0084  0.8628  6.5958 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.004671   0.035182   0.133    0.894    
z.lag.1     -0.997433   0.023993 -41.572   <2e-16 ***
  ---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 1.468 on 1739 degrees of freedom
Multiple R-squared:  0.4985,	Adjusted R-squared:  0.4982 
F-statistic:  1728 on 1 and 1739 DF,  p-value: < 2.2e-16


Value of test-statistic is: -41.5723 864.1266 

Critical values for test statistics: 
  1pct  5pct 10pct
tau2 -3.43 -2.86 -2.57
phi1  6.43  4.59  3.78

> TesteDF_Variacao_trend <- ur.df(variacao, "trend", lags = 0)
> summary(TesteDF_Variacao_trend)

############################################### 
# Augmented Dickey-Fuller Test Unit Root Test # 
############################################### 

Test regression trend 


Call:
  lm(formula = z.diff ~ z.lag.1 + 1 + tt)

Residuals:
  Min      1Q  Median      3Q     Max 
-8.0671 -0.8843 -0.0215  0.8662  6.5560 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)  5.667e-02  7.041e-02   0.805    0.421    
z.lag.1     -9.979e-01  2.400e-02 -41.578   <2e-16 ***
  tt          -5.970e-05  7.002e-05  -0.853    0.394    
---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 1.468 on 1738 degrees of freedom
Multiple R-squared:  0.4987,	Adjusted R-squared:  0.4981 
F-statistic: 864.4 on 2 and 1738 DF,  p-value: < 2.2e-16


Value of test-statistic is: -41.5777 576.2362 864.3541 

Critical values for test statistics: 
  1pct  5pct 10pct
tau3 -3.96 -3.41 -3.12
phi2  6.09  4.68  4.03
phi3  8.27  6.25  5.34

> Col1_Variacao <- c(" ",-2.58,"" ,-3.43, -3.43," ", -3.96, -3.96,-3.96)
> Col2_Variacao <- c(" ", -41.58,"" ,-41.572,0.133," ", -41.578, 0.805,-0.853)
> Col3_Variacao <- c(" ", "0.000"," ","0.000",0.894," ","0.000",0.421,0.394)
> Col4_Resultado <- c("", "Estacionária","","Estacionária", "Sem Drift","",
                      + "Estacionária", "Sem Drift", "Sem Tendência" )
> Resultado_Variacao <- cbind(Col1_Variacao,Col2_Variacao,Col3_Variacao,Col4_Resultado)
> colnames(Resultado_Variacao) <- c("T Cr�???tico 1%", "Estatistica T","P-Value", "Resultado")
> rownames(Resultado_Variacao) <- c("SEM CONSTANTE E SEM TENDÊNCIA",
                                    + "Yt-1",
                                    + "COM CONSTANTE",
                                    + "Yt-1", "Drift",
                                    + "COM CONSTANTE E COM TENDÊNCIA",
                                    + "Yt-1", "Drift","Trend")
> View(Resultado_Variacao)
> save.image("C:/EconometriaA/AULA-4/Comandos.RData")
> 
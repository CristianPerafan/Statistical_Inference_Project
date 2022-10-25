---
output:
  html_document: default
  word_document: default
---
# Hipotesis de un grupo

Se desea evaluar si el puntaje de las peliculas del catalogo de Netflix tiene en promedio una aceptacion o puntaje mayor a $5.0$ siendo la mitad del puntaje posible; siendo el maximo $10.0$ puntos. El fin de analizar si al publico le gusta el contenido que ofrece Netflix. 

Hipotesis del caso para el puntaje medio para una significancia del $5 \% $:

$H_0$: $μ \leq 5.0$

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

$H_a$: $μ >  5.0$

Rechazo $H_0$ si $Z_{cal} \ge Z_{0.95}$

$Z_{cal} \ge Z_{0.95}$

$Z_{cal}= \frac{\bar{x}-μ}{\frac{s}{\sqrt{n}}} \ge Z_{0.95} = 1.64$

$\frac{6.26 - 5.0}{\frac{1.13}{\sqrt{118}}} \ge 1.64$

# Hipotesis de dos grupos

Se desea evaluar si la aceptacion evaluada mediante el puntaje IMDb de los 2 generos con la mayor catidad de contenido en el catalogo de peliculas de Netflix tiene una gran diferencia para un nivel de significancia del $5 \%$. 

Analizando los datos, se determino que los 2 generos con más contenido son: International movies y Dramas, teniendo 1749 y 1469 datos respectivamente.

Primero, debemos evaluar si la desviación estandar de los 2 generos evaluados es diferente. Para ello se plantea una hipotesis para las varianzas, a fin de saber si se consideran iguales o diferentes.

Hipotesis para las varianzas de los 2 generos evaluados a un nivel de significancia del $5 \% $:

$H_0$: $\sigma _1 ^2  = \sigma _2 ^2$

$H_a$: $\sigma _1 ^2  \neq \sigma _2 ^2$

Rechazo $H_0$ si $F_{cal}>F_{\alpha / 2, (n1-1, n2-1)}$

Donde el numerador $S_1$ es el grupo del genero: ?. 

$F_{cal}>F_{\alpha / 2, (n1-1, n2-1)}$

$\frac{S_1 ^2}{S_2 ^2} > F_{0.05 / 2, (?, ?)}$

$\frac{?}{?} > F_{0.05 / 2, (?, ?)}$

$? > ?$


<<<<<<< HEAD
$Z_{cal}= \frac{? - 5.0}{\frac{?}{\sqrt{118}}} \ge 1.64$
=======
>>>>>>> 58de8a798b1141d8268089173c967aa4a8ad318d

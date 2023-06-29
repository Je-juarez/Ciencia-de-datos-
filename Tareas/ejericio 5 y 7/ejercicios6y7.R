# Ejercicio 5
# ¿Qué cantidad de dinero sobra al repartir 10000$ entre 3 personas?

x1 = 10000 %/% 3
x1
# 2. ¿Es el número 4560 divisible por 3?
x2 <- 4560
if(x2%%3 == 0){
  print(paste0(x2," divisible entre 3"))
} 

# 3. Construya un vector con los números enteros del 2 al 87. 
# ¿Cuáles de esos números son divisibles por 7?

num <- c(2:87)
numdiv <- num[c(2:87)%%7==0]
numdiv
# 4. Construya dos vectores, el primero con los números enteros desde 7 hasta 3, 
# el segundo vector con los primeros cinco números positivos divisibles por 5. 
# Sea A la condición de ser par en el primer vector. 
# Sea B la condición de ser mayor que 10 en el segundo vector. 
# ¿En cuál de las 5 posiciones se cumple A y B simultáneamente?
v1 <- 7:3
v2 <- seq(from=5, by=5, length.out = 5)

v1%%2 == 0 & v2>10

# 5. Consulte este enlace en el cual hay una anéctoda de Gauss niño. 
# Use R para obtener el resultado de la suma solicitada por el profesor del niño
# Gauss.

g <- (100*101)/2
g
# 6. Construya un vector con los siguientes elementos: 1, -4, 5, 9, -4. 
# Escriba un procedimiento para extraer las posiciones donde está el valor 
# mínimo en el vector.

x <- (c(1,-4,5,9,-4))
which.min(x)

# 7. Calcular 8!

prod(seq_len(8))

# 8.Evaluar la siguiente suma  ∑i=e**i donde i inicia en 3 y termina en 7

sum(exp(3:7))

# 9. Evaluar la siguiente productoria
# multi del 1 al 10 log raiz de i

prod(log(sqrt(1:10)))

# 10. Construya un vector cualquiera e inviertalo, es decir, que el primer 
# elemento quede de último, el segundo de penúltimo y así sucesivamente. 
# Compare su resultado con el de la función rev.

v1 <- c(2:7)
v2 <- v1[length(v1):1]
str(v2)

# 11. Create the vector: 1,2,3,...,20
v3 <- c(1:20)

# 12. Create the vector: 20,19,18,...,1
v4 <- c(20:1)
str(vec)

# 13. Create the vector: 1,-2,3,-4,5,-6,...,19,-20
v5 <- c(1:20)
v6 <- ifelse(x%%2==0,x*(-1),x)

#14. Create the vector: .1^3, .2^1, .1^6, .2^4, ... , 0.1^36, 0.2^34
v7 = c(seq(from = 3, to = 36, by = 3))
v8 = c(seq(from = 1, to = 34, by = 3))

l1 = length(v7)
l2 = length(v8)

v1 = c(seq(0.1,0.1, length.out = l1))
v2 = c(seq(0.2,0.2, length.out = l2))

v11 <- v1**v7
v21 <- v2**v8

#Combinar vectores
v <- c(as.numeric(rbind(v11, v21)))
length(v)
str(v)

# 15. Calculate the following:
# Suma de 10 a 100 de (i^3 + 4i^2)

sum((10:100)**3,4*(10:100)**2)

# 16. Read the data set available in: https://raw.githubusercontent.com/fhernanb/datos/master/Paises.txt

url <- 'https://raw.githubusercontent.com/fhernanb/datos/master/Paises.txt'
df <- read.table(url,header = TRUE)

# 17. Use a code to obtain the number of variables of the data set.
length(df[1,])

# 18. Use a code to obtain the number of countries in the data set.
length(df$Pais)
length(df[,1])
length(df[['Pais']])

# 19. Which is the country with the higher population?
myframe <- data.frame(df)
subset(myframe, subset = poblacion == max(poblacion))
subset(myframe, subset = poblacion == max(poblacion), select = c('Pais','poblacion'))

# 20. Which is the country with the lowest literacy rate?
subset(myframe, subset = alfabetizacion == min(alfabetizacion))

# 21. ¿Qué valor de verdad tiene la siguiente afirmación? 
# “Los resultados de la función floor y trunc son siempre los mismos”.
# Falso
floor(-1.1) == trunc(-1.1)

# En R hay unas bases de datos incluídas, una de ellas es la base de datos 
# llamada mtcars. Para conocer las variables que están en mtcars usted 
# puede escribir en la consola ?mtcars o también help(mtcars). 
# De la base mtcars obtenga bases de datos que cumplan las siguientes 
# condiciones.

require(graphics)
pairs(mtcars, main = "mtcars data", gap = 1/4)
coplot(mpg ~ disp | as.factor(cyl), data = mtcars,
       panel = panel.smooth, rows = 1)
## possibly more meaningful, e.g., for summary() or bivariate plots:
mtcars2 <- within(mtcars, {
  vs <- factor(vs, labels = c("V", "S"))
  am <- factor(am, labels = c("automatic", "manual"))
  cyl  <- ordered(cyl)
  gear <- ordered(gear)
  carb <- ordered(carb)
})
summary(mtcars2)

# 22. Autos que tengan un rendimiento menor a 18 millas por galón de combustible.
str(mtcars)
#Edgar
mtcars[mtcars$mpg < 18,]

# 23. Autos que tengan 4 cilindros.
mtcars[mtcars$cyl == 4,]

# 24. Autos que pesen más de 2500 libras y tengan transmisión manual.
mtcars[mtcars$wt > 2.500 & mtcars$am == 1 ,]

#Ejercicio  7

#Construya una función que reciba dos números reales a y b, 
# la función debe decir cuál es el mayor de ellos.


mq <- function(a,b){
  return (max(a,b))
}

mq(a,b)

# 2. Escriba una función llamada media que calcule la media muestral de un vector
# numérico x ingresado a la función. A continuación la fórmula para calcular 
# la media muestral.

x <- c(1,2,3,4,5,6)

mmtral <- function(x){
  return ( (sum(x)) / length(x) )
}

mmtral(x)

# 3. Construya una función que encuentre las raíces de una ecuación de segundo grado. 
# El usuario debe suministrar los coeficientes a, b y c de la ecuación ax^2+bx+c=0 y 
# la función debe entregar las raíces.

#x = (-b+-sqrt(b^2 - 4ac))/2a

#Coeficientes de la ecuacion:
a <- 2
b <- 2
c <- 2

fgeneral <- function(a,b,c){
  
  discriminante <- b**2 - 4*a*c
  
  if( a!=0 & discriminante >=0 ){
    x1 = (-b + sqrt(discriminante))/(2*a)
    x2 = (-b - sqrt(discriminante))/(2*a)  
    return (c(x1,x2))
  }
  else{
    return(print('Error, a=0 o  discriminante < 0'))
  }
}

fgral(a,b,c)

# 4. Escribir una función que calcule la velocidad de un proyectil dado que el 
# usuario ingresa la distancia recorrida en Km y el tiempo necesario en minutos. 
# Expresar el resultado se debe entregar en metros/segundo, recuerde que

# Velocidad = espacio / tiempo

# distancia en km
d <- 5

# tiempo en segundos
t <- 3
velo <- function(distancia_km,tiempo){
  
  if (tiempo >= 0){
    distancia_m <- distancia_km*1000
    return ( print(paste0('velocidad = ', v <- distancia_m / tiempo, ' m/s.' ) ) ) 
  }
  else{
    return(print('Error, tiempo < 0 '))
  }
  
}

velo(d,t)

# 5. Escribir una función que reciba dos valores a y b y que los intercambie.
# Es decir si ingresa a=4 y b=9 que la funcion entregue a=9 y b=4

a <- 3
b <- 4

print(paste0('Aquí a = ',a,' y b = ',b,'.'))

intercambio <- function(a,b){
  c <- a
  a <- b
  b <- c
  return(print(paste0('Ahora a = ',a,' y b = ', b,'.')))
}

intercambio(a,b)

# 6. Construya una función a la cual le ingrese el salario por hora y el número
# de horas trabajadas durante una semana por un trabajador. La función debe 
# calcular el salario neto.

#salario por hora
s_h <- 100

#horas trabajadas en el mes
h_t <- 160

#salario neto: cantidad recibida al mes
sal_neto <- function(sal_hora,h_trab){
  
  #return(print(paste0('salario neto = $', sal_hora*h_trab,'.00')))
  return(sal_hora*h_trab)
}

print(sal_neto(s_h,h_t))

# 7. Construya una función llamada precio que calcule el precio total de sacar 
# A fotocopias y B impresiones, sabiendo que los precios son 50 y 100 pesos 
# para A y B respectivamente si el cliente es un estudiante, y de 75 y 150 para 
# A y B si el cliente es un profesor. La función debe tener dos argumentos 
# cuantitativos (A y B) y el argumento lógico estudiante que por defecto 
# tenga el valor de TRUE. Use la estructura mostrada abajo.

precio <- function(A, B, estudiante=FALSE) {
  
  if (estudiante == TRUE)
    precio.total <- A*50 + B*100
  else
    precio.total <- A*75 + B*150
  
  return(precio.total)
}

precio(100,50)
100*75 + 50*150

# 8. Construya una función llamada salario que le ingrese el salario por hora 
# y el número de horas trabajadas durante una semana por un trabajador. 
# La función debe calcular el salario neto semanal, teniendo en cuenta que si 
# el número de horas trabajadas durante la semana es mayor de 48, esas horas 
# de demás se consideran horas extras y tienen un 35% de recargo. 
# Imprima el salario neto. Use la estructura mostrada abajo.

salario <- function(num.horas,valor.hora){
  
  if (num.horas > 48){
    h_extra <- num.horas-48
    #salario.neto <- 48*valor.hora + h_extra*valor.hora*1.35
    salario.neto <- valor.hora*(48 + h_extra*1.35)
  }
  else{
    salario.neto <- num.horas*valor.hora
  }
  
  return(salario.neto)
}

salario(50,100)

# 9. Construya una función llamada nota que calcule la nota obtenida por un 
# alumno en una evaluación de tres puntos cuya ponderación o importancia son 
# 20%, 30% y 50% para los puntos I, II y III respectivamente. 
# Adicionalmente la función debe generar un mensaje sobre si el estudiante 
# aprobó la evaluación o no. El usuario debe ingresar las notas individuales 
# de los tres puntos y la función debe entregar la nota final de la evaluación. 
# Use la estructura mostrada abajo.

nota <- function(p1, p2, p3){
  
}

# 10. Escriba una función llamada minimo que permita obtener el valor mínimo 
# de un vector numérico. No puede usar ninguna de las funciones básicas de R 
# como which.min(), which.max(), order(), min( ), max( ), sort( ) u order( ). 
# Use la estructura mostrada abajo.

# Bubble sort
# minimo <- function(x){
# 
#   for (i in c( 1 : (length(x)-1) ) ){
# 
#     for (j in c( 1 : (length(x)-i) ) ) {
#       if(x[j] > x[j+1]){
#         x[c(j,j+1)] <- x[c(j+1,j)]
#       }
# 
#     }
#   }
# 
#   minimo <- x[c(1)]
#   return(minimo)
# }

# seleccion

minimo <- function(x){
  
  for (i in c( 1 : (length(x)-1) ) ){
    if (x[i]>x[i+1]){
      minimo <- x[i+1]
    }
    else{
      minimo <- x[i]
    }
  }
  
  return(minimo)
  
}

x <- c(9,8,4,7,2,9)

minimo(x)
print(paste0('minimo = ',minimo(x)))

library(microbenchmark)
microbenchmark(minimo(x))
# Test
# v <- c(5,2,7,5,8)
# 
# for(i in v[c(1:length(v)-1)] ){
#   print(i) 
# }
# v[1]>v[2]

# 11. Construya una función que calcule las coordenadas del punto medio M
# entre dos puntos A y B. Vea la siguiente figura para una ilustración.
# ¿Cuáles cree usted que deben ser los parámetros de entrada de la función?

#P1(x1,y1)
p1 <- c(5,4)

#P2(x2,y2)
p2 <- c(0,10)

punto_M <- function(p1,p2){
  
  px_m <- (p1[1]+p2[1])/2
  py_m <- (p1[2]+p2[2])/2
  punto_M <- c(px_m,py_m)
  
  return (punto_M)
}

punto_M(p1,p2)
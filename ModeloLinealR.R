rm(list = ls())
## Regresión lineal simple

file = "https://raw.githubusercontent.com/fhernanb/datos/master/propelente"
datos = read.table(file=file, header=TRUE)
View(datos)
str(datos)
plot(datos$Edad, datos$Resistencia, xlab='Edad', ylab='Resistencia')

modelo = lm(datos$Resistencia ~ datos$Edad, data=datos)
modelo

summary(modelo)

plot(datos$Edad, datos$Resistencia, xlab='Edad', ylab='Resistencia')
abline(modelo)

names(modelo)

modelo$fitted.values # datos evaluados en el modelo, también se puede predict(modelo) o fitted(modelo)

modelo$residuals # residuales (reales - observados)

# intervalos de confianza para los parámetros
confint(modelo) # para cambiar nivel de confianza: confint(modelo, level = 0.9)

anova(modelo)

## Diagnóstico del modelo
# Homocedasticidad
plot(predict(modelo), modelo$residuals)

# Normalidad
shapiro.test(modelo$residuals)
qqnorm(modelo$residuals)
qqline(modelo$residuals)
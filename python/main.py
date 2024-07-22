def calcular_imc():
    imc = peso * 10000 // (altura ** 2)
    if imc < 19:
        return 1
    elif 19 <= imc < 25:
        return 2
    else:
        return 3

altura = 180  # altura em centímetros
peso = 105  # peso em quilogramas

faixa_imc = calcular_imc()
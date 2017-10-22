require 'logger'

@logger = Logger.new('./log_calc.log')
@logger.info "Iniciando Calculadora"

def soma(n,m)
    @logger.info "Somando os valores #{@valor1} e #{@valor2}"
    n+m
end

def subtrai(n,m)
    @logger.info "Subtraindo os valores #{@valor1} e #{@valor2}"
    n-m
end

def multiplica(n,m)
    @logger.info "Multiplicando os valores #{@valor1} e #{@valor2}"
    n*m
end

def divide(n,m)
    @logger.info "Dividindo os valores #{@valor1} e #{@valor2}"
    n/m
end

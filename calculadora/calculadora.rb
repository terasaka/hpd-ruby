require './def_calc.rb'
require 'logger'

@i = 'a'

while @i != 'x' do

    puts "Valor 1:"
@valor1 = gets.chomp
@logger.debug "Valor1 informado pelo usuario #{@valor1}"

puts "Informe a operacao:"
@operacao = gets.chomp
@logger.debug "Operacao informada pelo usuario #{@valor1}"

puts "Valor 2:"
@valor2 = gets.chomp
@logger.debug "Valor2 informado pelo usuario #{@valor2}"

case @operacao
when '+'
    resultado = soma(@valor1.to_i,@valor2.to_i)
    @logger.debug "Somar #{@valor1} e #{@valor2}"
when '-'
    resultado = subtrai(@valor1.to_i,@valor2.to_i)
    @logger.debug "Subtrair #{@valor1} e #{@valor2}"
when '*'
    resultado = multiplica(@valor1.to_i,@valor2.to_i)
    @logger.debug "Multiplicar #{@valor1} e #{@valor2}"
when '/'
    resultado = divide(@valor1.to_i,@valor2.to_i)
    @logger.debug "Dividir #{@valor1} e #{@valor2}"
end

puts "O resultado de #{@valor1} #{@operacao} #{@valor2} = #{resultado}"
@logger.info "Finalizado"

puts "Digite x para sair ou enter para uma nova operacao"
@i = gets.chomp
end




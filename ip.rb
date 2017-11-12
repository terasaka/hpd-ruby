require './def.rb'
require 'logger'
require 'socket'

# Pega o usuario logado e o IP
@user = `whoami`.strip
@ip_address = Socket.ip_address_list.find { |ai| ai.ipv4? && !ai.ipv4_loopback? }.ip_address

checa_arquivo_ip

if (ARGV[0] == "-list") && (ARGV[1] == "dev")
    lista_ips
        elsif (ARGV[0] == "-new") && (ARGV[1] == "dev")
            # Le o arquivo
            ip = File.read("ip_disponivel")
            if (ip.empty? == false)
            # Transforma num array
            disponiveis = ip.split
            # Reserva um IP e remove do Array
            reserva = disponiveis.pop
            puts "Para a Vlan #{ARGV[1]} utilize o IP #{reserva}"
            puts "Usuario/IP do solicitante #{@user} / #{@ip_address}"
            # Grava o Array no arquivo após o endereço removido pelo pop
            temp = File.open("ip_disponivel", "w") do |file|
                file.puts disponiveis
            end
            
            # Escreve no arquivo o ip reservado e o login que solicitou
            temp = File.open("ip_uso", "a") do |file|
                file.puts "#{reserva} - #{@user}"
            end
            
            else
                puts "Acabaram os IPs seu animal"
            end
        #puts "Pega esse ip aqui #{file[0]} da vlan #{ARGV[1]}"
        else 
            erro_opcao
end
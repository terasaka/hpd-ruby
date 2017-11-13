require './def.rb'
require 'logger'
require 'socket'

# Pega o usuario logado, IP e HOSTNAME
@user = `whoami`.strip
@logger.debug "Usuario logado #{@user}"

@ip_address = Socket.ip_address_list.find { |lista| lista.ipv4? && !lista.ipv4_loopback? }.ip_address
@hostname = Socket.gethostname
@logger.debug "IP do usuario logado: #{@ip_address}"
@logger.debug "HOSTNAME do usuario logado: #{@hostname}"

checa_arquivo_ip

@logger.debug "Opcao digitada pelo usuario #{ARGV[0]} / #{ARGV[1]}"
if (ARGV.empty?)
    erro_opcao
elsif (ARGV[0].downcase == "-list") && (ARGV[1].downcase == "dev")
    lista_ips
        elsif (ARGV[0].downcase == "-new") && (ARGV[1].downcase== "dev")
            # Le o arquivo
            ip = File.read("ip_disponivel")
            if (!ip.empty?)
            # Transforma num array
            disponiveis = ip.split
            # Reserva um IP e remove do Array
            reserva = disponiveis.pop
            puts "Para a Vlan #{ARGV[1]} utilize o IP #{reserva}"
            @logger.info "IP #{reserva} reservado para Login: #{@user} / IP: #{@ip_address} / HOSTNAME: #{@hostname}"
            # Grava o Array no arquivo após o endereço removido pelo pop
            temp = File.open("ip_disponivel", "w") do |file|
                file.puts disponiveis
            end
            
            # Escreve no arquivo o ip reservado e o login que solicitou
            temp = File.open("ip_uso", "a") do |file|
                file.puts "#{reserva} - #{@user}"
                @logger.info "IP #{reserva} em uso registrado no arquivo ip_uso"
            end
            
            else
                puts "Acabaram os IPs seu animal"
                @logger.error "Acabaram os IPs disponiveis em ip_disponivel"
            end
        else 
            erro_opcao

    end
require 'thor'
require 'logger'
require 'socket'


class Cli < Thor
    @@user = `whoami`.strip
    @@ip_address = Socket.ip_address_list.find { |lista| lista.ipv4? && !lista.ipv4_loopback? }.ip_address
    @@hostname = Socket.gethostname

    @@logger = Logger.new('./cli.log')
    @@logger.info "--------------------------------------------"
    @@logger.info "Gerador de IPs - HPD2.0"
    @@logger.info "--------------------------------------------"
    
        # Pra alterar o nivel de log altere o valor abaixo:
        # Logger::WARN
        # Logger::DEBUG
        # Logger::FATAL
        # Logger::ERROR
    
    @@logger.level = Logger::INFO
    
    if (File.exist?('ip_disponivel'))
        @@logger.info "--------------------------------------------"
        @@logger.info "Arquivo ip_disponivel localizado, iniciando a leitura."
        @@logger.info "--------------------------------------------"
    else
        cria_ip_disponivel = File.open('ip_disponivel', 'w') do |file|
            file.puts "10.1.10.3\n10.1.10.4\n10.1.10.5\n10.1.10.9\n10.1.10.20\n10.1.10.22\n10.1.10.57\n10.1.10.59"
            @@logger.info "Arquivo nao existia, criando lista de IPs."
        end
    end
    
    desc("list dev","Lista os IPs disponiveis na Vlan DEV")
    def list(dev)
        puts "Listando IPs disponiveis na Vlan DEV"
        ip = File.read("ip_disponivel")
        puts ip
        @@logger.info "Lendo ips disponiveis"
    end

    desc("new dev","Libera um novo IP na Vlan DEV")
    def new(dev)
        # Le o arquivo
        ip = File.read("ip_disponivel")
        if (!ip.empty?)
        # Transforma num array
        disponiveis = ip.split
        # Reserva um IP e remove do Array
        reserva = disponiveis.pop
        puts "Para a Vlan #{ARGV[1]} utilize o IP #{reserva}"
        @@logger.info "IP #{reserva} reservado para Login: #{@@user} / IP: #{@@ip_address} / HOSTNAME: #{@@hostname}"
        # Grava o Array no arquivo após o endereço removido pelo pop
        temp = File.open("ip_disponivel", "w") do |file|
            file.puts disponiveis
        end
        
        # Escreve no arquivo o ip reservado e o login que solicitou
        temp = File.open("ip_uso", "a") do |file|
            file.puts "#{reserva} - #{@@user}"
            @@logger.info "IP #{reserva} em uso registrado no arquivo ip_uso"
        end
    else
        puts "Acabaram os IPs seu animal"
        @@logger.error "Acabaram os IPs disponiveis em ip_disponivel"
    end
    end
    
    desc("limpa","Limpa os arquivos que foram utilizados e recria o arquivo de IPs disponiveis ")
    def limpa
        puts "Limpando arquivos..."
        system("rm ./ip_*")
        #File.delete("./ip_uso")
        #File.delete("./ip_disponivel")
        @@logger.info "--------------------------------------------"
        @@logger.info "------------ Arquivos deletados ------------"
        @@logger.info "Os arquivos ip_uso e ip_disponivel foram deletados"
        @@logger.info "Auditoria:"
        @@logger.info "Login: #{@@user}"  
        @@logger.info "IP: #{@@ip_address}"
        @@logger.info "HOSTNAME: #{@@hostname}"
        @@logger.info "--------------------------------------------"
    end

end

Cli.start(ARGV)

require 'logger'

@logger = Logger.new('./ip_disponiveis.log')
@logger.info "--------------------------------------------"
@logger.info "Gerador de IPs - HPD"

# Pra alterar o nivel de log altere o valor abaixo:
# Logger::WARN
# Logger::DEBUG
# Logger::FATAL
# Logger::ERROR

@logger.level = Logger::INFO

# Trata o erro da opcao
def erro_opcao
    @logger.fatal "Digitou opcao invalida"
    puts "Opcao invalida"
    puts "Utilize as opcoes:"
    puts "-list dev - Para listar"
    puts "-new dev - Para solicitar um novo IP"
end

# Checa se o arquivo ip_disponivel existe, se não existir ele é criado com os IPs disponiveis
def checa_arquivo_ip
    if (File.exist?('ip_disponivel'))
        @logger.info "Arquivo ip_disponivel localizado, iniciando a leitura."
    else
        cria_ip_disponivel = File.open('ip_disponivel', 'w') do |file|
            file.puts "10.1.10.3\n10.1.10.4\n10.1.10.5\n10.1.10.9\n10.1.10.20\n10.1.10.22\n10.1.10.57\n10.1.10.59"
            @logger.info "Arquivo nao existia, criando lista de IPs."
        end
    end
end

# Lista os IPs lidos do arquivo ip_disponivel
def lista_ips
    ip = File.read("ip_disponivel")
    puts ip
    @logger.info "Lendo ips disponiveis"
end
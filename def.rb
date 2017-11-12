require 'socket'
# Trata o erro da opcao
def erro_opcao
    puts "Opcao invalida"
    puts "Utilize as opcoes:"
    puts "-list dev - Para listar"
    puts "-new dev login - Para solicitar um novo IP"
end

# Creca se o arquivo ip_disponivel existe, se não existir ele é criado com os IPs disponiveis
def checa_arquivo_ip
    if (File.exist?('ip_disponivel'))
    else
        cria_ip_disponivel = File.open('ip_disponivel', 'w') do |file|
            file.puts "10.1.10.3\n10.1.10.4\n10.1.10.5\n10.1.10.9\n10.1.10.20\n10.1.10.22\n10.1.10.57\n10.1.10.59"
        end
    end
end

# Lista os IPs lidos do arquivo ip_disponivel
def lista_ips
    ip = File.read("ip_disponivel")
    puts ip
end
@@login = ARGV[2]
if (ARGV[0] == "-list") && (ARGV[1] == "dev")
    ip = File.read("ip_disponivel")
    puts ip

        elsif (ARGV[0] == "-new") && (ARGV[1] == "dev")
            # Le o arquivo
            ip = File.read("ip_disponivel")
            if (ip.empty? == false)
            # Transforma num array
            disponiveis = ip.split
            # Reserva um IP e remove do Array
            reserva = disponiveis.pop
            puts "Para a Vlan #{ARGV[1]} usa o IP #{reserva}"
            puts "Reservado para #{ARGV[2]}"
            # Grava o Array no arquivo após o endereço removido pelo pop
            temp = File.open("ip_disponivel", "w") do |file|
                file.puts disponiveis
            end
            
            # Escreve no arquivo o ip reservado e o login que solicitou
            temp = File.open("ip_uso", "a") do |file|
                file.puts "#{reserva} - #{ARGV[2]}"
            end
            
            else
                puts "Acabaram os IPs seu animal"
            end
        #puts "Pega esse ip aqui #{file[0]} da vlan #{ARGV[1]}"
        else 
            puts "Opcao invalida"
            puts "Utilize as opcoes:"
            puts "-list dev - Para listar"
            puts "-new dev login - Para solicitar um novo IP"

end
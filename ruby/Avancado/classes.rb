# Criando uma classe e atribuindo atributos e metodos

class Conta
    attr_accessor :saldo, :nome

    def initialize(nome)
        self.saldo = 0.0
        self.nome = nome
    end

    def deposita(valor_deposito)
        self.saldo += valor_deposito
        puts "Depositando o valor de #{valor_deposito} reais na conta de #{self.nome}"
    rescue Exception => e
        puts e.message
        puts e.backtrace 
    end
    
    def sacar(valor_saque)
        if valor_saque <= 0 
            puts "#{self.nome} Informe um valor maior que 0"
        else 
            self.saldo -= valor_saque
            puts "Sacando #{valor_saque} da sua conta"
        end
    rescue Exception => e
        puts e.message
        puts e.backtrace    
    end
end

objeto_conta = Conta.new("Gabriel")
objeto_conta.deposita(145.50)
objeto_conta.deposita(20)
puts "#{objeto_conta.nome}, o saldo da sua conta é de: #{objeto_conta.saldo}"
objeto_conta.sacar(40)
puts "#{objeto_conta.nome}, o saldo da sua conta é de: #{objeto_conta.saldo}"



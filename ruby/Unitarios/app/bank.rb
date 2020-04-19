class Conta
    attr_accessor :saldo
    attr_accessor :limit_saque
    attr_accessor :nome
    attr_accessor :mensagem

    def initialize(saldo)
        self.saldo = saldo
    end

    def sacar(valor_saque, limit_saque, taxa)
        if valor_saque <= 0 
            self.mensagem = "Você não possui saldo."
        elsif self.saldo < valor_saque
            self.mensagem = 'Saldo insuficiente para saque.'
        elsif valor_saque > limit_saque
            self.mensagem = "Limite máximo por saque é de R$ " + limit_saque.to_s
        else 
            self.saldo -= valor_saque + taxa
            #puts "Sacando #{valor_saque} da sua conta"
        end
    rescue Exception => e
        puts e.message
        puts e.backtrace    
    end
end

# Herança

class ContaCorrente < Conta
    def sacar(valor_saque, limit_saque = 700.00, taxa = 5.0)
        super
    end
end

class ContaPoupanca < Conta
    def sacar(valor_saque, limit_saque = 500.00, taxa = 2.0)
        super
    end
end
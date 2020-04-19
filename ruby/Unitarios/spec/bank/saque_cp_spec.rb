require_relative '../../app/bank'

# Testes unitários com Rspec
describe ContaPoupanca do
    describe 'sacar' do
        context 'sacar em conta corrente' do
            before(:all) do
                @cp = ContaPoupanca.new(1000.00)
                @cp.sacar(200.00)
            end
            it 'meu saldo final deve ser R$ 800' do
                expect(@cp.saldo).to eq 798.00
            end
        end
        context 'Quando o saldo é zero' do
            before(:all) do
                @cp = ContaPoupanca.new(0.0)
                @cp.sacar(100.00)
            end
            it 'Entao exibe a mensagem' do
                expect(@cp.mensagem).to eq 'Saldo insuficiente para saque.'
            end
            it 'E o saldo permanece zerado' do
                expect(@cp.saldo).to eq 0.00
            end
        end  
        context 'Quando meu saldo é insuficiente' do
            before(:all) do
                @cp = ContaPoupanca.new(500.00)
                @cp.sacar(501.00)
            end
            it 'Entao exibo a mensagem' do
                expect(@cp.mensagem).to eq 'Saldo insuficiente para saque.' 
            end
            it 'E o saldo permece o mesmo' do
                expect(@cp.saldo).to eq 500.0
            end
        end 
        context 'Quando supera o limite de sacar' do
            before(:all) do
                @cp = ContaPoupanca.new(1000.00)
                @cp.sacar(701.00)
            end
            it 'Entao exibe mensagem' do
                expect(@cp.mensagem).to eq 'Limite máximo por saque é de R$ 500.0' 
            end
            it 'E o saldo permanece o mesmo' do
                expect(@cp.saldo).to eq 1000.00
            end
        end  
    end
end
require_relative '../../app/bank'

# Testes unitários com Rspec
describe ContaCorrente do
    describe 'Saque' do
        context 'Saque em conta corrente' do
            before(:all) do
                @cc = ContaCorrente.new(1000.00)
                @cc.sacar(200.00)
            end
            it 'meu saldo final deve ser R$ 800' do
                expect(@cc.saldo).to eq 795.00
            end
        end
        context 'Quando o saldo é zero' do
            before(:all) do
                @cc = ContaCorrente.new(0.0)
                @cc.sacar(100.00)
            end
            it 'Entao exibe a mensagem' do
                expect(@cc.mensagem).to eq 'Saldo insuficiente para saque.'
            end
            it 'E o saldo permanece zerado' do
                expect(@cc.saldo).to eq 0.00
            end
        end  
        context 'Quando meu saldo é insuficiente' do
            before(:all) do
                @cc = ContaCorrente.new(500.00)
                @cc.sacar(501.00)
            end
            it 'Entao exibo a mensagem' do
                expect(@cc.mensagem).to eq 'Saldo insuficiente para saque.' 
            end
            it 'E o saldo permece o mesmo' do
                expect(@cc.saldo).to eq 500.0
            end
        end 
        context 'Quando supera o limite de saque' do
            before(:all) do
                @cc = ContaCorrente.new(1000.00)
                @cc.sacar(701.00)
            end
            it 'Entao exibe mensagem' do
                expect(@cc.mensagem).to eq 'Limite máximo por saque é de R$ 700.0' 
            end
            it 'E o saldo permanece o mesmo' do
                expect(@cc.saldo).to eq 1000.00
            end
        end  
    end
end
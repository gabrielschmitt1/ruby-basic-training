class Avengers
    attr_accessor :list

    def initialize
        self.list = []
    end

    def put(avenger)
        self.list.push(avenger)
    end
end

# TDD Desenvolvimento guiado por testes
describe Avengers do

    it 'Deve adicionar um vingador' do
        obj_avergers = Avengers.new
        obj_avergers.put('Spiderman')
        expect(obj_avergers.list).to eql ['Spiderman'] 
    end

    it 'Deve adicionar uma lista de vingadores' do
        hq = Avengers.new
        hq.put('Spiderman')
        hq.put('Thor')
        hq.put('Hulk')
        res = hq.list.size > 0
        
        # Verifica se o conteudo esta incluido na lista
        expect(hq.list).to include 'Thor'
        # Verifica se a lista é um array e se seu tamanho é maior que 0
        expect(hq.list.size).to be > 0
        # Res retorna um booleano.
        expect(res).to be true 
    end

    it 'Spiderman deve ser o primeiro da lista' do
        hq = Avengers.new
        hq.put('Spiderman')
        hq.put('Thor')
        hq.put('Hulk')
        expect(hq.list).to start_with('Spiderman')
    end

    it 'Hulk deve ser o ultimo da lista' do
        hq = Avengers.new
        hq.put('Spiderman')
        hq.put('Thor')
        hq.put('Hulk')
        expect(hq.list).to end_with('Hulk')
    end

    it 'Deve conter o sobrenome' do
        avenger = 'Piter Parker'
        expect(avenger).to match(/Parker/)
    end
end


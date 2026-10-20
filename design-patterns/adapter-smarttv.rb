# 1. Interface esperada pela casa
class Dispositivo
  def ligar
    raise NotImplementedError
    # Por que? Para indicar que a subclasse deve implementar o método. 
  end

  def desligar
    raise NotImplementedError
  end
end
# A classe Dispositivo representa o contrato esperado pelo sistema da casa. 
# ----


# 2. Biblioteca Externa (API da TV)
class SmartTV
  def power_on
    puts "Smart TV ligada!"
  end

  def power_off
    puts "Smart TV desligada!"
  end
end


# 3. Adapter entre o sistema e a Smart TV:
class SmartTVAdapter < Dispositivo
  def initialize(tv) # Constructor
    @tv = tv
  end

  def ligar
    @tv.power_on
  end

  def desligar
    @tv.power_off
  end
end
# Sistema solicita "ligar()", o adaptador chama "power_on()" na TV. 
# @tv armazena uma instância da classe SmartTV, fazendo com que o adaptador tenha uma referência ao objeto que está adaptando.

# 4. Cliente: Sistema de Automação
class CasaInteligente
  def initialize(dispositivo)
    @dispositivo = dispositivo
  end

  def ativar
    @dispositivo.ligar
  end

  def desativar
    @dispositivo.desligar
  end
end
# Casa não sabe o funcionamento da TV - apenas chama o método que espera achar;
# 

# 5. Execução
tv = SmartTV.new
adaptador = SmartTVAdapter.new(tv)

casa = CasaInteligente.new(adaptador)

casa.ativar
casa.desativar
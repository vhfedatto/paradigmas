# 1. Interface esperada pela casa
class Dispositivo
  def ligar
    raise NotImplementedError
  end

  def desligar
    raise NotImplementedError
  end
end


# 2. Biblioteca Externa (API da TV)
class SmartTV
  def power_on
    puts "Smart TV ligada!"
  end

  def power_off
    puts "Smart TV desligada!"
  end
end

# Exercício a parte
class Lampada < Dispositivo
  def ligar
    puts "Luz acesa!"
  end

  def desligar
    puts "Luz desligada!"
  end
end

class AC
  def iniciar_resfriamento
    puts "Ar-Condicionado ligado!"
  end

  def interromper_resfriamento
    puts "Ar-Condicionado desligado!"
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

# 3.1 Adapter entre o sistema e o AC:
class ACAdapter < Dispositivo
  def initialize(ac) # Constructor
    @ac = ac
  end

  def ligar
    @ac.iniciar_resfriamento
  end

  def desligar
    @ac.interromper_resfriamento
  end
end

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


# 5. Execução
tv = SmartTV.new
adaptador = SmartTVAdapter.new(tv)

casa_tv = CasaInteligente.new(adaptador)

casa_tv.ativar
casa_tv.desativar

puts ""

# Config da Lâmpada:
lampada = Lampada.new
casa_luz = CasaInteligente.new(lampada)

casa_luz.ativar
casa_luz.desativar

puts ""

# Config do Ar Condicionado

ac = AC.new
ac_adapter = ACAdapter.new(ac)
casa_ac = CasaInteligente.new(ac_adapter)

casa_ac.ativar
casa_ac.desativar
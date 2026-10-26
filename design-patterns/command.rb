# ========================================
# PARTE 1 — ADAPTER (projeto anterior)
# ========================================

class Dispositivo
  def ligar
    raise NotImplementedError
  end

  def desligar
    raise NotImplementedError
  end
end

# Bibliotecas externas
class SmartTV
  def power_on
    puts "Smart TV ligada!"
  end

  def power_off
    puts "Smart TV desligada!"
  end
end

class AC
  def iniciar_resfriamento
    puts "Ar-condicionado ligado!"
  end

  def interromper_resfriamento
    puts "Ar-condicionado desligado!"
  end
end

# Dispositivo compatível
class Lampada < Dispositivo
  def ligar
    puts "Luz acesa!"
  end

  def desligar
    puts "Luz desligada!"
  end
end

# Adaptadores
class SmartTVAdapter < Dispositivo
  def initialize(tv)
    @tv = tv
  end

  def ligar
    @tv.power_on
  end

  def desligar
    @tv.power_off
  end
end

class ACAdapter < Dispositivo
  def initialize(ac)
    @ac = ac
  end

  def ligar
    @ac.iniciar_resfriamento
  end

  def desligar
    @ac.interromper_resfriamento
  end
end

# ========================================
# PARTE 2 — COMMAND
# ========================================

# 1. Interface Command
class Comando
  def executar
    raise NotImplementedError
  end
end
# Declara a operação comum que todos os comandos concretos devem implementar. Em Ruby, utilizamos uma classe-base para representar esse contrato.

# 2. Comandos concretos
class LigarDispositivo < Comando
  def initialize(dispositivo)
    @dispositivo = dispositivo
  end

  def executar
    @dispositivo.ligar
  end
end

class DesligarDispositivo < Comando
  def initialize(dispositivo)
    @dispositivo = dispositivo
  end

  def executar
    @dispositivo.desligar
  end
end
# Comando recebe o destinatário no construtor e armazena sua referência em @dispositivo;
# Quando executar() é chamado, encaminha a solicitação para "ligar()";
# A mesma classe pode ligar qualquer uma, pois não precisa conhecer a classe concreta do equipamento, apenas a interface esperada.

# 3. Invoker (Remetente)
class ControleRemoto
  def initialize
    @botoes = {}
  end

  def configurar_botao(nome, comando)
    @botoes[nome] = comando
  end

  def pressionar(nome)
    comando = @botoes[nome]

    unless comando
      raise ArgumentError, "Botao nao configurado"
    end

    comando.executar
  end
end
# Controle remoto seria o invoker - recebe a solicitação de pressionar o botão, recupera o comando associado e executa a operação. Ele apenas invoca o executar().
# Hash @botoes permite armazenar diversos comandos, cada um associado a um nome.

# ========================================
# PARTE 3 — CLIENT (CONFIGURAÇÃO)
# ========================================

# Criando os destinatários
tv = SmartTVAdapter.new(SmartTV.new)
lampada = Lampada.new
ac = ACAdapter.new(AC.new)

# Criando o controle remoto
controle = ControleRemoto.new

# Criando e associando os comandos
controle.configurar_botao(
  :ligar_tv, LigarDispositivo.new(tv)
)

controle.configurar_botao(
  :desligar_tv, DesligarDispositivo.new(tv)
)

controle.configurar_botao(
  :ligar_lampada, LigarDispositivo.new(lampada)
)

controle.configurar_botao(
  :desligar_lampada, DesligarDispositivo.new(lampada)
)

controle.configurar_botao(
  :ligar_ac, LigarDispositivo.new(ac)
)

controle.configurar_botao(
  :desligar_ac, DesligarDispositivo.new(ac)
)

# ========================================
# PARTE 4 — EXECUÇÃO DOS COMANDOS
# ========================================

controle.pressionar(:ligar_tv)
controle.pressionar(:ligar_lampada)
controle.pressionar(:ligar_ac)

controle.pressionar(:desligar_tv)
controle.pressionar(:desligar_lampada)
controle.pressionar(:desligar_ac)
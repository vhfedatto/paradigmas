# ============================================================
# CLASSE BASE: ModuloNave
# ============================================================

class ModuloNave

  def initialize(nome, energia)
    @nome = nome
    @energia = energia
  end

  # Mostra a energia atual
  def mostrar_energia
    puts "Energia disponivel: #{@energia}"
  end

  
  # Método geral
  # Ideia de que todo módulo deve possuir um método ativar().
  # As classes filhas vão substituir esse comportamento.
  def ativar
    puts "O modulo precisa implementar o metodo ativar."
  end

  # Controla o consumo de energia
  def consumir_energia(valor)

    if valor > @energia
      puts "Energia insuficiente."
      return false
    end

    @energia -= valor

    return true
  end

end

# ============================================================
# MOTOR
# ============================================================

class Motor < ModuloNave

  def ativar

    puts "\nTentando ativar o motor..."

    if consumir_energia(30)

      puts "Motor ativado!"
      puts "Propulsao iniciada."

    end
  end

end

# ============================================================
# ESCUDO
# ============================================================

class Escudo < ModuloNave

  def ativar

    puts "\nTentando ativar o escudo..."

    if consumir_energia(20)

      puts "Escudo ativado!"
      puts "Campo de protecao estabelecido."

    end
  end

end

# ============================================================
# SUPORTE DE VIDA
# ============================================================

class SuporteDeVida < ModuloNave

  def ativar

    puts "\nTentando ativar o suporte de vida..."

    if consumir_energia(10)

      puts "Suporte de vida ativado!"
      puts "Oxigenio e temperatura estabilizados."

    end
  end

end

# ============================================================
# CRIAÇÃO DOS OBJETOS
# ============================================================

motor = Motor.new("Motor Principal", 100)

escudo = Escudo.new("Escudo Defletor", 50)

suporte = SuporteDeVida.new("Suporte de Vida", 40)

# ============================================================
# POLIMORFISMO
# ============================================================

modulos = [
  motor,
  escudo,
  suporte
]

modulos.each do |modulo|

  modulo.ativar

  modulo.mostrar_energia

end
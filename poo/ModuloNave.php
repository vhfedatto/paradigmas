<?php

// ============================================================
// CLASSE BASE: ModuloNave
// ============================================================

class ModuloNave
{
    public $nome;
    public $energia;

    public function __construct($nome, $energia)
    {
        $this->nome = $nome;
        $this->energia = $energia;
    }

    // Mostra a energia atual
    public function mostrarEnergia()
    {
        echo "Energia disponivel: " . $this->energia . PHP_EOL;
    }

    // Método geral
    // Ele representa a ideia de que todo módulo deve possuir um método ativar().
    // As classes filhas vão substituir esse comportamento.
    public function ativar()
    {
        echo "O modulo precisa implementar o metodo ativar." . PHP_EOL;
    }

    // Controla o consumo de energia
    public function consumirEnergia($valor)
    {
        if ($valor > $this->energia)
        {
            echo "Energia insuficiente." . PHP_EOL;

            return false;
        }

        $this->energia -= $valor;

        return true;
    }
}

// ============================================================
// MOTOR
// ============================================================

class Motor extends ModuloNave
{
    public function ativar()
    {
        echo PHP_EOL . "Tentando ativar o motor..." . PHP_EOL;

        if ($this->consumirEnergia(30))
        {
            echo "Motor ativado!" . PHP_EOL;
            echo "Propulsao iniciada." . PHP_EOL;
        }
    }
}

// ============================================================
// ESCUDO
// ============================================================

class Escudo extends ModuloNave
{
    public function ativar()
    {
        echo PHP_EOL . "Tentando ativar o escudo..." . PHP_EOL;

        if ($this->consumirEnergia(20))
        {
            echo "Escudo ativado!" . PHP_EOL;
            echo "Campo de protecao estabelecido." . PHP_EOL;
        }
    }
}

// ============================================================
// SUPORTE DE VIDA
// ============================================================

class SuporteDeVida extends ModuloNave
{
    public function ativar()
    {
        echo PHP_EOL . "Tentando ativar o suporte de vida..." . PHP_EOL;

        if ($this->consumirEnergia(10))
        {
            echo "Suporte de vida ativado!" . PHP_EOL;
            echo "Oxigenio e temperatura estabilizados." . PHP_EOL;
        }
    }
}

// ============================================================
// CRIAÇÃO DOS OBJETOS
// ============================================================

$motor = new Motor("Motor Principal", 100);

$escudo = new Escudo("Escudo Defletor", 50);

$suporte = new SuporteDeVida("Suporte de Vida", 40);

// ============================================================
// POLIMORFISMO
// ============================================================

$modulos = [
    $motor,
    $escudo,
    $suporte
];

foreach ($modulos as $modulo)
{
    $modulo->ativar();

    $modulo->mostrarEnergia();
}
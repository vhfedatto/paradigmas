use strict;
use warnings;

# ============================================================
# CLASSE BASE: ModuloNave
# ============================================================

package ModuloNave;

# Construtor
sub new
{
    my ($class, $nome, $energia) = @_;

    my $self = {
        nome => $nome,
        energia => $energia
    };

    bless $self, $class;
    return $self;
}

# Mostra a energia atual
sub mostrar_energia
{
    my ($self) = @_;
    print "Energia disponivel: $self->{energia}\n";
}


# Método geral
# As classes filhas vão substituir esse comportamento.
sub ativar
{
    print "O modulo precisa implementar o metodo ativar.\n";
}

# Controla o consumo de energia
sub consumir_energia
{
    my ($self, $valor) = @_;

    if ($valor > $self->{energia})
    {
        print "Energia insuficiente.\n";
        return 0;
    }

    $self->{energia} -= $valor;
    return 1;
}

# ============================================================
# MOTOR
# ============================================================

package Motor;

# Motor herda de ModuloNave
our @ISA = ('ModuloNave');

sub ativar
{
    my ($self) = @_;

    print "\nTentando ativar o motor...\n";

    if ($self->consumir_energia(30))
    {
        print "Motor ativado!\n";
        print "Propulsao iniciada.\n";
    }
}

# ============================================================
# ESCUDO
# ============================================================

package Escudo;

our @ISA = ('ModuloNave');

sub ativar
{
    my ($self) = @_;

    print "\nTentando ativar o escudo...\n";

    if ($self->consumir_energia(20))
    {
        print "Escudo ativado!\n";
        print "Campo de protecao estabelecido.\n";
    }
}

# ============================================================
# SUPORTE DE VIDA
# ============================================================

package SuporteDeVida;

our @ISA = ('ModuloNave');

sub ativar
{
    my ($self) = @_;

    print "\nTentando ativar o suporte de vida...\n";

    if ($self->consumir_energia(10))
    {
        print "Suporte de vida ativado!\n";
        print "Oxigenio e temperatura estabilizados.\n";
    }
}

# ============================================================
# CRIAÇÃO DOS OBJETOS
# ============================================================

package main;

my $motor = Motor->new(
    "Motor Principal",
    100
);

my $escudo = Escudo->new(
    "Escudo Defletor",
    50
);

my $suporte = SuporteDeVida->new(
    "Suporte de Vida",
    40
);

# ============================================================
# POLIMORFISMO
# ============================================================

my @modulos = (
    $motor,
    $escudo,
    $suporte
);

foreach my $modulo (@modulos)
{
    $modulo->ativar();

    $modulo->mostrar_energia();
}
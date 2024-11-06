require 'test/unit'
require_relative '../lib/ss/nivel'

# Clase que contiene las pruebas unitarias de la clase Nivel.
class TestNivel < Test::Unit::TestCase
  # Método para inicializar las pruebas de la clase Nivel.
  def setup
    @nivel = Ss::Nivel.new("III", :Naranja, :Urgente, 30)
    @nivel1 = Ss::Nivel.new("V", :Negro, :"No urgente", 60)
  end

  # Prueba para verificar que cada objeto Nivel tiene los atributos correctos.
  def test_atributos_nivel
    assert_equal("V", @nivel1.nivel)
    assert_equal(:Negro, @nivel1.color)
    assert_equal(:"No urgente", @nivel1.categoria)
    assert_equal(60, @nivel1.tiempo_atencion)
  end

  # Prueba para verificar que se lanzan errores con valores inválidos.
  def test_errores_valores
    assert_raise(ArgumentError) { Ss::Nivel.new("VI", :Azul, :Reanimacion, 0) }
    assert_raise(ArgumentError) { Ss::Nivel.new("I", :Amarillo, :Reanimacion, 0) }
    assert_raise(ArgumentError) { Ss::Nivel.new("I", :Rojo, :Critico, 0) }
    assert_raise(ArgumentError) { Ss::Nivel.new("I", :Azul, :Reanimacion, 10) }
  end

  # Prueba para verificar que se lanzan errores con tipos de datos incorrectos.
  def test_errores_tipo
    assert_raise(TypeError) { Ss::Nivel.new(1, :Verde, :"No urgente", 45) }
    assert_raise(TypeError) { Ss::Nivel.new("IV", "Verde", :Emergencia, 15) }
    assert_raise(TypeError) { Ss::Nivel.new("II", :Rojo, "Emergencia", 7) }
    assert_raise(TypeError) { Ss::Nivel.new("II", :Azul, :Urgente, "10") }
  end

  # Prueba para verificar el método to_s en una instancia válida.
  def test_to_s
    expected_output = "Nivel: III, Color: Naranja, Categoría: Urgente, Tiempo de atención: 30"
    assert_equal(expected_output, @nivel.to_s)
    expected_output1 = "Nivel: V, Color: Negro, Categoría: No urgente, Tiempo de atención: 60"
    assert_equal(expected_output1, @nivel1.to_s)
  end
end
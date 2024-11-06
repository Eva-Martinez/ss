require 'test/unit'
require_relative '../lib/ss/hora'

# Clase que contiene las pruebas unitarias de la clase Hora.
class TestHora < Test::Unit::TestCase
  # Método para inicializar las pruebas de la clase Hora.
  def setup
    @hora = Ss::Hora.new(8, 30, 5)
    @hora1 = Ss::Hora.new(16, 0, 59)
  end

  # Prueba para verificar que cada objeto Hora tiene los atributos correctos.
  def test_atributos_hora
    assert_equal(8, @hora.hora)
    assert_equal(30, @hora.minuto)
    assert_equal(5, @hora.segundo)
  end

  # Prueba para verificar que se lanzan errores con valores inválidos.
  def test_errores_valores
    assert_raise(ArgumentError) { Ss::Hora.new(27, 59, 0) }
    assert_raise(ArgumentError) { Ss::Hora.new(22, 60, 27) }
    assert_raise(ArgumentError) { Ss::Hora.new(15, 46, 68) }
  end

  # Prueba para verificar que se lanzan errores con tipos de datos incorrectos.
  def test_errores_tipo
    assert_raise(TypeError) { Ss::Hora.new("22", 59, 0) }
    assert_raise(TypeError) { Ss::Hora.new(22, '45', 27) }
    assert_raise(TypeError) { Ss::Hora.new(15, 46, :"11") }
  end

  # Prueba para verificar el método to_s en una instancia válida.
  def test_to_s
    expected_output = "Hora: 8, Minuto: 30, Segundo: 5"
    assert_equal(expected_output, @hora.to_s)
    expected_output1 = "Hora: 16, Minuto: 0, Segundo: 59"
    assert_equal(expected_output1, @hora1.to_s)
  end
end